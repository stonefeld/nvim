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

" Ctrl-P.
Plug 'ctrlpvim/ctrlp.vim'

" LSP.
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'

" Quick commentaries.
Plug 'tpope/vim-commentary'

" Color preview.
Plug 'lilydjwg/colorizer'

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

" Jump to next or previous entry on quickfix list.
nnoremap <silent> <A-n> :lnext<CR>
nnoremap <silent> <A-p> :lprevious<CR>
nnoremap <silent> <A-q> :lclose<CR>

" Move lines up and down while selected.
vnoremap <silent> J :m '>+1<CR>gv
vnoremap <silent> K :m '<-2<CR>gv

" Navigate through buffers.
nnoremap <silent> <M-l> :bnext<CR>
nnoremap <silent> <M-h> :bprevious<CR>
nnoremap <silent> <M-w> :Bclose<CR>
nnoremap <silent> <leader>o :call JumpToBuffer()<CR>

" Yank the rest of the line instead of the whole line.
nnoremap <silent> Y y$

" Keep the cursor centered in the screen.
nnoremap <silent> n nzzzv
nnoremap <silent> N Nzzzv
nnoremap <silent> J mzJ`z

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

" Resource the neovim config.
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>:echomsg 'Configuration updated'<CR>

" ---------- Lua ---------- "
" Require lua config files.
lua require('stonefeld')
