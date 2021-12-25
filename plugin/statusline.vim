" ---------- Statusline ---------- "
" Building custom statusline.
let g:currentmode={
      \ 'n': 'Normal ',
      \ 'i': 'Insert ',
      \ 'v': 'Visual ',
      \ 'V': 'V-line ',
      \ "\<C-V>": 'V-block ',
      \ 'R': 'Replace ',
      \ 'Rv': 'V-replace ',
      \ 'c': 'Command ',
      \ 't': 'Terminal '
      \ }

" Get git branch name.
fu! GetGitBranch()
  let l:is_git_dir=trim(system('git rev-parse --is-inside-work-tree'))
  if l:is_git_dir ==# 'true'
    let g:git_branch='󰘬 ' . trim(system('git -C ' . getcwd() . ' branch --show-current'))
  else
    let g:git_branch=''
  endif
endfu

" Set custom statusline.
fu! SetStatusline(focused)
  setl stl=
  if a:focused == 'true'
    setl stl=%#Debug#\ %-10.(%{g:currentmode[mode()]}%#ToolbarButton#%)
  else
    setl stl=%*\ %-10.(%{g:currentmode[mode()]}%)
  endif
  setl stl+=\ %-20.(%{get(g:,'git_branch','')}%)
  setl stl+=%=%10.50{expand('%:~:.')}
  setl stl+=\ %m%r
  setl stl+=%=%32.([%5l:%5c]\ %y%)
endfu

" set stl=%<%{expand('%:~:.')}\ %h%m%r%=%-14.(%l,%c%V%)\ %P
call SetStatusline('true')

" Set different statusline on netrw and terminal windows.
aug Statusline
  au!

  " Display focused/unfocused styles when changing window.
  au WinEnter,BufEnter * call SetStatusline('true')
  au WinLeave,BufLeave * call SetStatusline('false')

  " Update git branch name on bufenter.
  au BufEnter * call GetGitBranch()

  " Display only the filename on netrw window.
  au FileType netrw setlocal stl=%{expand('%:~:.')}
  au FileType netrw au WinEnter,BufEnter <buffer> setlocal stl=%{expand('%:~:.')}
  au FileType netrw au WinLeave,BufLeave <buffer> setlocal stl=%*%{expand('%:~:.')}

  " Only display the name 'terminal' when a terminal window is open.
  au FileType term setlocal stl=terminal
  au FileType term au WinEnter,BufEnter <buffer> setlocal stl=terminal
  au FileType term au WinLeave,BufLeave <buffer> setlocal stl=%*terminal
aug END
