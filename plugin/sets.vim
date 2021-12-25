" ---------- Global Preferences ---------- "
" Enable syntax highlighting.
syntax on

" Disable spell check.
set nospell

" Avoid swap and undo files.
set noswapfile
set noundofile
set nobackup

" Improve some visual effects.
set cmdheight=1
set scrolloff=3
set sidescrolloff=3
set signcolumn=yes
set foldcolumn=auto:9

" Disable the status message on the command prompt space.
set noshowmode

" Disable line limit.
set colorcolumn=0
set hidden

" Configure tab settings.
set tabstop=4 softtabstop=4
set shiftwidth=4
set noexpandtab
set smarttab

" Configure indentation.
set autoindent
set cindent
set cinoptions=(0,l1,t0,=0

" Avoid line wraping.
set nowrap

" Always split on the right side and below.
set splitright
set splitbelow

" Set relative number.
set nu
set relativenumber
set nocursorline
" set cursorlineopt=number

" Increase updatetime and enable mouse interaction.
set updatetime=250
set mouse=a

" Hide menu message.
set shortmess+=c

" Enable incremental search.
set incsearch
set nohlsearch

" Configure wildmenu.
set wildoptions=tagfile
set wildignore=*.o,*.obj,*.exe,*.bin

" Set listchars for end-of-line, trailing and tab characters.
set list
set listchars=tab:\|\ ,trail:.
