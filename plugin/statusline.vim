" ---------- Statusline ---------- "
" Building custom statusline.
set statusline=%#StatusLineOuterBlock#\ %{toupper(g:currentmode[mode()])}\ %#StatusLineInnerBlock#%{StatuslineGitBranch()}%{&mod?'\ +\ ':''}%#StatusLine#\ %{expand('%:~:.')}\ %{&readonly?'[RO]':''}%=%#StatusLineInnerBlock#\ %l,%c\ \|\ %{&fileformat!=#''?&fileformat.'\ ':'none\ '}\|\ %{&fileencoding!=#''?&fileencoding.'\ ':'none\ '}%#StatusLineOuterBlock#\ %{&filetype!=#''?&filetype.'\ ':'none\ '}
aug SetStatusline
  au!
  au WinEnter * setlocal statusline=%#StatusLineOuterBlock#\ %{toupper(g:currentmode[mode()])}\ %#StatusLineInnerBlock#%{StatuslineGitBranch()}%{&mod?'\ +\ ':''}%#StatusLine#\ %{expand('%:~:.')}\ %{&readonly?'[RO]':''}%=%#StatusLineInnerBlock#\ %l,%c\ \|\ %{&fileformat!=#''?&fileformat.'\ ':'none\ '}\|\ %{&fileencoding!=#''?&fileencoding.'\ ':'none\ '}%#StatusLineOuterBlock#\ %{&filetype!=#''?&filetype.'\ ':'none\ '}
  au WinLeave * setlocal statusline=%#StatusLineNC#\ %{toupper(g:currentmode[mode()])}\ %{StatuslineGitBranch()}%{&mod?'\ +\ ':''}\ %{expand('%:~:.')}\ %{&readonly?'[RO]':''}%=\ %l,%c\ \|\ %{&fileformat!=#''?&fileformat.'\ ':'none\ '}\|\ %{&fileencoding!=#''?&fileencoding.'\ ':'none\ '}\ %{&filetype!=#''?&filetype.'\ ':'none\ '}

  au FileType netrw setlocal statusline=\ %#StatusLine#%{expand('%:~:.')}
  au FileType netrw au WinEnter,BufEnter <buffer> setlocal statusline=\ %#StatusLine#%{expand('%:~:.')}
  au FileType netrw au WinLeave,BufLeave <buffer> setlocal statusline=\ %#StatusLineNC#%{expand('%:~:.')}
aug END

let g:currentmode={
      \ "n": "NORMAL",
      \ "v": "VISUAL",
      \ "V": "V-LINE",
      \ "\<C-V>": "V-BLOCK",
      \ "i": "INSERT",
      \ "r": "REPLACE",
      \ "R": "REPLACE",
      \ "Rv": "V-REPLACE",
      \ "c": "COMMAND",
      \ "t": "TERMINAL"
      \ }
