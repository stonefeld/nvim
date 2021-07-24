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

" Ctrl-P.
Plug 'ctrlpvim/ctrlp.vim'

" LSP.
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" Quick commentaries.
Plug 'tpope/vim-commentary'

" Show color preview.
Plug 'lilydjwg/colorizer'

" Syntax highlighting.
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'sheerun/vim-polyglot'

" Colorschemes.
Plug 'stonefeld/nordokai'
Plug 'stonefeld/nordiy'
Plug 'flazz/vim-colorschemes'
Plug 'sainnhe/sonokai'

call plug#end()

" ---------- Keybindings ---------- "
" Map the leader key.
let mapleader=" "

" Open file explorer.
nnoremap <silent> <leader>e :Vex!<CR>

" Resizing panes.
nnoremap <A-C-Left> :vertical resize +5<CR>
nnoremap <A-C-Right> :vertical resize -5<CR>
nnoremap <A-C-Up> :resize +1<CR>
nnoremap <A-C-Down> :resize -1<CR>

" Jump to next or previous entry on quickfix list.
nnoremap <A-n> :lnext<CR>
nnoremap <A-p> :lprevious<CR>
nnoremap <A-q> :lclose<CR>

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

" Run figlet on the selected content.
vnoremap <silent> <leader>ff :!figlet<CR>

" Resource the neovim config.
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

" ---------- Lua ---------- "
" Require lua config files.
lua require('stonefeld')
