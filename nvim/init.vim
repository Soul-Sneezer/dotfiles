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
Plug 'lewis6991/gitsigns.nvim'
Plug 'romgrk/barbar.nvim'
Plug 'nvimdev/dashboard-nvim'
Plug 'nvimdev/lspsaga.nvim' 
Plug 'HiPhish/rainbow-delimiters.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' }
Plug 'lervag/vimtex'
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

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'

" Or with a generic interface:
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
let g:vimtex_compiler_method = 'latexrun'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = ","
