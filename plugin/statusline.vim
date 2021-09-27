" ---------- Statusline ---------- "
" Building custom statusline.
set statusline=%#StatusLineOuterBlock#\ %{toupper(g:currentmode[mode()])}\ %#StatusLineInnerBlock#%{StatuslineGitBranch()}%{&mod?'+\ ':''}%{&readonly?'+\ ':''}%#StatusLine#\ %{expand('%:~:.')}%=%#StatusLineInnerBlock#\ %(%l,%c%)\ %#StatusLineOuterBlock#\ %{&filetype!=#''?&filetype.'\ ':'none\ '}
augroup SetStatusline
  autocmd!
  autocmd WinEnter * setlocal statusline=%#StatusLineOuterBlock#\ %{toupper(g:currentmode[mode()])}\ %#StatusLineInnerBlock#%{StatuslineGitBranch()}%{&mod?'+\ ':''}%{&readonly?'+\ ':''}%#StatusLine#\ %{expand('%:~:.')}%=%#StatusLineInnerBlock#\ %(%l,%c%)\ %#StatusLineOuterBlock#\ %{&filetype!=#''?&filetype.'\ ':'none\ '}
  autocmd WinLeave * setlocal statusline=%#StatusLineNC#\ %{toupper(g:currentmode[mode()])}\ %{StatuslineGitBranch()}%{&mod?'+\ ':''}%{&readonly?'+\ ':''}\ %{expand('%:~:.')}%=\ %(%l,%c%)\ \ %{&filetype!=#''?&filetype.'\ ':'none\ '}
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
