" Pluggins
call plug#begin()
    Plug 'Yggdroot/indentLine'
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate'}
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-cmp' 
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'ayu-theme/ayu-vim'
    Plug 'chrisbra/Colorizer'
    Plug 'preservim/nerdcommenter'
call plug#end()

" setup autocompletion
set completeopt=menu,menuone,noselect

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

luafile ~/.config/nvim/plugins/cmp_conf.lua
luafile ~/.config/nvim/plugins/lsp_conf.lua

" Clorscheme
set termguicolors     " enable true colors support
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

" Tab => 4 spaces
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" Vertical line
set cc=80

" Change leader key
let mapleader = " "

" prevent nvim from hiding symbols in markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" disable search highlight
:set nohlsearch!

" Enable line numbers
set number
set relativenumber

" Auto close brackets
inoremap " ""<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O


" Auto close tags
autocmd FileType html,xhtml,xml inoremap < <><left>

" Ident line config
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" my fzf config 
nnoremap <leader>f :FZF<CR>
let g:fzf_action = { 'ctrl-s': 'split', 'ctrl-v': 'vsplit' }

" Customize fzf colors to match your color scheme
let g:fzf_colors = { 'border': ['fg', 'Operator'] } 
