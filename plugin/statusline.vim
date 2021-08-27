" ---------- Statusline ---------- "
" Building custom statusline.
set statusline=
set statusline+=\ %-8.(%{toupper(g:currentmode[mode()])}%)
set statusline+=\ \%-25.(%{StatuslineGitBranch()}\ %m\ %r%)
set statusline+=%=%{expand('%:~:.')}
set statusline+=%=%16.(%l,%c%)
set statusline+=\ %17.(%Y%)
set statusline+=\ 

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
