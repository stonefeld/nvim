"                        _
"  _ __   ___  _____   _(_)_ __ ___
" | '_ \ / _ \/ _ \ \ / / | '_ ` _ \
" | | | |  __/ (_) \ V /| | | | | | |
" |_| |_|\___|\___/ \_/ |_|_| |_| |_|

" ---------- Initialization ---------- "
filetype indent plugin on

" ---------- Plugins ---------- "
" Install plugins via vim-plug.
call plug#begin("~/.local/share/nvim/site/plugged")

" FZF.
Plug 'junegunn/fzf.vim'
Plug 'gfanto/fzf-lsp.nvim'

" LSP.
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" Quick commentaries.
Plug 'tpope/vim-commentary'

" Show color preview.
Plug 'lilydjwg/colorizer'

" Git integration.
Plug 'tpope/vim-fugitive'

" LaTeX compiler.
Plug 'lervag/vimtex'

" Markdown preview.
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Syntax highlighting.
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'sheerun/vim-polyglot'

" Colorschemes.
Plug 'stonefeld/nordokai'
Plug 'flazz/vim-colorschemes'

call plug#end()

" ---------- Keybindings ---------- "
" Map the leader key.
let mapleader=" "

" Open file explorer.
nnoremap <silent> <leader>e :Vex!<CR>

" Resizing panes.
nnoremap <A-C-h> :vertical resize +5<CR>
nnoremap <A-C-l> :vertical resize -5<CR>
nnoremap <A-C-k> :resize +1<CR>
nnoremap <A-C-j> :resize -1<CR>

" Jump to next or previous entry on quickfix list.
nnoremap <A-n> :cnext<CR>
nnoremap <A-p> :cprevious<CR>

" Move between window panes.
nnoremap <silent> <C-l> :wincmd l<CR>
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-j> :wincmd j<CR>

" Move lines up and down while selected.
vnoremap <silent> J :m '>+1<CR>gv=gv
vnoremap <silent> K :m '<-2<CR>gv=gv

" Navigate through buffers.
nnoremap <silent> <M-l> :bnext<CR>
nnoremap <silent> <M-h> :bprevious<CR>
nnoremap <silent> <M-w> :Bclose<CR>
nnoremap <silent> <leader>o :call JumpToBuffer()<CR>

" Fold code blocks.
vnoremap <silent> <leader>fo :fold<CR>
nnoremap <silent> <leader>fi :foldopen<CR>
nnoremap <silent> <leader>fc :foldclose<CR>

" Run figlet on the selected content.
vnoremap <silent> <leader>ff :!figlet<CR>

" ---------- Lua ---------- "
" Require lua config files.
lua require('stonefeld')
