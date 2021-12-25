"  _       _ _         _
" (_)_ __ (_) |___   _(_)_ __ ___
" | | '_ \| | __\ \ / / | '_ ` _ \
" | | | | | | |_ \ V /| | | | | | |
" |_|_| |_|_|\__(_)_/ |_|_| |_| |_|

" ---------- Initialization ---------- "
filetype indent plugin on

" ---------- Plugins ---------- "
" Set the plugin installation folder.
if has('nvim')
  let g:plug_home=stdpath('data') . '/site/plugged'
endif

" Install plugins via vim-plug.
call plug#begin()

" nvim-only plugins.
if has('nvim')
  " LSP.
  Plug 'neovim/nvim-lspconfig'

  " Completion.
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-path'

  " Syntax highlighting.
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
endif

" Smart Tabs
Plug 'dpc/vim-smarttabs'

" Ctrl-P
Plug 'kien/ctrlp.vim'

" Syntax highlighting.
Plug 'sheerun/vim-polyglot'

" Colorschemes.
Plug 'stonefeld/nordokai'

call plug#end()

" ---------- Keybindings ---------- "
" Map the leader key.
let mapleader=' '

" Open file explorer.
nnoremap <silent> <leader>e <cmd>Lexplore<CR>

" Resizing panes.
nnoremap <silent> <M-C-Left> <cmd>vertical resize +5<CR>
nnoremap <silent> <M-C-Right> <cmd>vertical resize -5<CR>
nnoremap <silent> <M-C-Up> <cmd>resize +1<CR>
nnoremap <silent> <M-C-Down> <cmd>resize -1<CR>

" Move lines up and down while selected.
vnoremap <silent> J :m '>+1<CR>gv
vnoremap <silent> K :m '<-2<CR>gv

" Open, close and navigate quickfixlist faster.
nnoremap <silent> <leader>q <cmd>call QFixToggle(0)<CR>
nnoremap <silent> <leader>n <cmd>try<bar>cnext<bar>catch /^Vim\%((\a\+)\)\=:E\%(553\<bar>42\):/<bar>cfirst<bar>endtry<CR>
nnoremap <silent> <leader>p <cmd>try<bar>cprevious<bar>catch /^Vim\%((\a\+)\)\=:E\%(553\<bar>42\):/<bar>clast<bar>endtry<CR>

" Navigate through buffers.
nnoremap <silent> <C-l> <cmd>bn<CR>
nnoremap <silent> <C-h> <cmd>bp<CR>
nnoremap <silent> <C-k> <cmd>bp<CR>:bd #<CR>

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
vnoremap <silent> <leader>ff <cmd>!figlet<CR>
