require('lualine').setup()
config = require('dashboard').setup()
-- This module contains a number of default definitions
local rainbow_delimiters = require 'rainbow-delimiters'

vim.g.rainbow_delimiters = {
    strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
    },
    query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
    },
    highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
    },
}

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
}

local lsp = require "lspconfig"

local keyset = vim.keymap.set
keyset("n", "<leader>f", ":!firefox <C-r>=expand('%:r')<cr>.html &<cr>")
keyset("n", "<leader>q", ":!zathura <C-r>=expand('%:r')<cr>.pdf &<cr>")

-- Setup nvim-cmp
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Remove default `<C-y>` mapping
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require('luasnip').expand_or_jumpable() then
        require('luasnip').expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require('luasnip').jumpable(-1) then
        require('luasnip').jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `git` source
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
-- Ensure Mason is installed
require("mason").setup()
require("mason-lspconfig").setup({
        ensure_installed = { "jdtls" },
    })

-- Set up LSP servers
local lspconfig = require('lspconfig')

-- Python
lspconfig.pyright.setup{}

-- C/C++
lspconfig.clangd.setup{}

-- Assembly
lspconfig.asm_lsp.setup{}

-- Rust
lspconfig.rust_analyzer.setup{}

-- Go
lspconfig.gopls.setup{}

-- Java
lspconfig.jdtls.setup({
    cmd = { "java", "-Declipse.application=org.eclipse.jdt.ls.core.id1", "-Dosgi.bundles.defaultStartLevel=4", "-Declipse.product=org.eclipse.jdt.product", "-Duser.library.path=/path/to/jdtls/libs", "-jar", "/path/to/jdtls/plugins/org.eclipse.equinox.launcher_*.jar", "-configuration", "/path/to/jdtls/config_win", "-data", "/path/to/workspace" },
    root_dir = lspconfig.util.root_pattern(".git", "pom.xml", "build.gradle", "settings.gradle"),
})

-- CSS
lspconfig.cssls.setup{}

-- Bash
lspconfig.bashls.setup{}

-- Optionally, you can also set up the capabilities for completion
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Example for setting capabilities for one of the language servers
lspconfig.pyright.setup{
    capabilities = capabilities,
}
require("parrot").setup {
      -- Providers must be explicitly added to make them available.
      providers = {
        -- provide an empty list to make provider available (no API key required)
        github = {
          api_key = os.getenv "GITHUB_TOKEN",
        },
      }
  }
