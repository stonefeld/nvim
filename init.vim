"  _       _ _         _
" (_)_ __ (_) |___   _(_)_ __ ___
" | | '_ \| | __\ \ / / | '_ ` _ \
" | | | | | | |_ \ V /| | | | | | |
" |_|_| |_|_|\__(_)_/ |_|_| |_| |_|

" ---------- Initialization ---------- "
filetype indent plugin on

" ---------- Plugins ---------- "
" Install plugins via vim-plug.
call plug#begin("~/.local/share/nvim/site/plugged")

" LSP.
Plug 'neovim/nvim-lspconfig'

" Completion.
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'

" Syntax highlighting.
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'sheerun/vim-polyglot'

" Colorschemes.
Plug 'stonefeld/nordokai'

call plug#end()

" ---------- Keybindings ---------- "
" Map the leader key.
let mapleader=" "

" Open file explorer.
nnoremap <silent> <leader>e :Lexplore<CR>

" Resizing panes.
nnoremap <silent> <M-C-Left> :vertical resize +5<CR>
nnoremap <silent> <M-C-Right> :vertical resize -5<CR>
nnoremap <silent> <M-C-Up> :resize +1<CR>
nnoremap <silent> <M-C-Down> :resize -1<CR>

" Move lines up and down while selected.
vnoremap <silent> J :m '>+1<CR>gv
vnoremap <silent> K :m '<-2<CR>gv

" Navigate through buffers.
nnoremap <silent> <C-l> :bn<CR>
nnoremap <silent> <C-h> :bp<CR>
nnoremap <silent> <C-k> :bp<CR>:bd #<CR>

" Yank the rest of the line instead of the whole line.
nnoremap <silent> Y y$

" Keep the cursor centered in the screen.
nnoremap <silent> n nzzzv
nnoremap <silent> N Nzzzv

" Undo break points.
inoremap <Space> <Space><C-g>u
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u

" Jumplist mutations.
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Run figlet on the selected content.
vnoremap <silent> <leader>ff :!figlet<CR>

" ---------- Lua ---------- "
" Require lua config files.
lua require('stonefeld')
