" ---------- Statusline ---------- "
" Building custom statusline.
set stl=%<%{expand('%:~:.')}\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Set different statusline on netrw and terminal windows.
aug FileTypeStatusline
  au!

  " Display only the filename on netrw window.
  au FileType netrw setlocal stl=%{expand('%:~:.')}

  " Only display the name 'terminal' when a terminal window is open.
  au FileType term setlocal stl=terminal
aug END
