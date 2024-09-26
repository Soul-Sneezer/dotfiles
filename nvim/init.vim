call plug#begin('~/.local/share/nvim/site/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'yamatsum/nvim-nonicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'pineapplegiant/spaceduck', { 'branch':'main' }
Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }
Plug 'vlime/vlime', {'rtp': 'vim/'}
Plug 'Olical/conjure'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tree-sitter/tree-sitter'
Plug 'lewis6991/gitsigns.nvim'
Plug 'romgrk/barbar.nvim'
Plug 'nvimdev/dashboard-nvim'
Plug 'nvimdev/lspsaga.nvim' 
Plug 'HiPhish/rainbow-delimiters.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' }
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'KeitaNakamura/tex-conceal.vim'
" main one
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

" Third party sources -- See https://github.com/ms-jpq/coq.thirdparty
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
Plug 'neovim/nvim-lspconfig'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
call plug#end()

colorscheme moonfly
  :set number
  augroup asm_ft
    au!
    autocmd BufNewFile,BufRead *.s set ft=nasm
  augroup end

  lua require('config')

" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_view_method = 'zathura'
hi Conceal ctermbg=none

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

setlocal spell
set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

lua require("coq")
let g:coq_settings = { 'auto_start': v:true }

set expandtab      " Converts tabs to spaces
set tabstop=4      " Number of spaces that a tab counts for
set shiftwidth=4   " Number of spaces used for indentation
set softtabstop=4  " Number of spaces when editing with tabs

