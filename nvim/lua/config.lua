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
local coq = require "coq"

lsp.tsserver.setup({})
lsp.tsserver.setup(coq.lsp_ensure_capabilities{})
vim.cmd('COQnow -s')

local keyset = vim.keymap.set
keyset("n", "<leader>f", ":!firefox <C-r>=expand('%:r')<cr>.html &<cr>")
keyset("n", "<leader>q", ":!zathura <C-r>=expand('%:r')<cr>.pdf &<cr>")
