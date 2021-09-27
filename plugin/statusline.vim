" ---------- Statusline ---------- "
" Building custom statusline.
set statusline=%#StatusLineOuterBlock#\ %{toupper(g:currentmode[mode()])}\ %#StatusLineInnerBlock#%{StatuslineGitBranch()}%{&mod?'\ +\ ':''}%#StatusLine#\ %{expand('%:~:.')}\ %{&readonly?'[RO]':''}%=%#StatusLineInnerBlock#\ %(%l,%c%)\ %#StatusLineOuterBlock#\ %{&filetype!=#''?&filetype.'\ ':'none\ '}
augroup SetStatusline
  autocmd!
  autocmd WinEnter * setlocal statusline=%#StatusLineOuterBlock#\ %{toupper(g:currentmode[mode()])}\ %#StatusLineInnerBlock#%{StatuslineGitBranch()}%{&mod?'\ +\ ':''}%#StatusLine#\ %{expand('%:~:.')}\ %{&readonly?'[RO]':''}%=%#StatusLineInnerBlock#\ %(%l,%c%)\ %#StatusLineOuterBlock#\ %{&filetype!=#''?&filetype.'\ ':'none\ '}
  autocmd WinLeave * setlocal statusline=%#StatusLineNC#\ %{toupper(g:currentmode[mode()])}\ %{StatuslineGitBranch()}%{&mod?'\ +\ ':''}\ %{expand('%:~:.')}\ %{&readonly?'[RO]':''}%=%(%l,%c%)\ \ %{&filetype!=#''?&filetype.'\ ':'none\ '}
augroup END

let g:currentmode={
      \ "n": "NORMAL",
      \ "v": "VISUAL",
      \ "V": "V-LINE",
      \ "\<C-V>": "V-BLOCK",
      \ "i": "INSERT",
      \ "R": "REPLACE",
      \ "Rv": "V-REPLACE",
      \ "c": "COMMAND",
      \ "t": "TERMINAL"
      \ }
