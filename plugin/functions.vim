" ---------- Scripts ---------- "
" List open buffers and jump to one of them by typing the buffer number.
function! JumpToBuffer()
  :buffers
  let b:num = input('Enter buffer number: ')
  :execute 'b' . b:num
endfunction

" Get git branch name (if available).
function! GetGitBranch()
  let l:is_git_dir = system('echo -n $(git rev-parse --is-inside-work-tree)')
  let g:git_branch = l:is_git_dir == 'true' ?
        \ system('bash -c "echo -n $(git rev-parse --abbrev-ref HEAD)"') : ''
endfunction

" Return git branch name (if available) for the statusline.
function! StatuslineGitBranch()
  if len(g:git_branch) == 0
    return ''
  else
    return ' ' . g:git_branch . ' '
  endif
endfunction

" Start live-server on current working directory.
command! StartLiveServer call StartLiveServer()
function! StartLiveServer()
  call StopLiveServer()
  silent exe '!(live-server "' . expand('%:p:h') . '" &) >/dev/null'
  silent exe '!echo $(ps -eaf | grep "live-server ' . expand('%:p:h') . '" | sed "/grep/d;s/\s\+/ /g" | cut -d " " -f 2) > /tmp/live-serverpid'
  " redraw!
endfunction

" Stop currently running live-server.
command! StopLiveServer call StopLiveServer()
function! StopLiveServer()
  silent exe '!kill -9 $(cat /tmp/live-serverpid)'
  silent exe '!rm -f /tmp/live-serverpid'
endfunction

" Delete buffer while keeping window layout (don't close buffer's windows).
if v:version < 700 || exists('loaded_bclose') || &cp
  finish
endif
let loaded_bclose = 1
if !exists('bclose_multiple')
  let bclose_multiple = 1
endif

" Display an error message.
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

" Better function to delete buffers.
function! s:Bclose(bang, buffer)
  if empty(a:buffer)
    let btarget = bufnr('%')
  elseif a:buffer =~ '^\d\+$'
    let btarget = bufnr(str2nr(a:buffer))
  else
    let btarget = bufnr(a:buffer)
  endif
  if btarget < 0
    call s:Warn('No matching buffer for '.a:buffer)
    return
  endif
  if empty(a:bang) && getbufvar(btarget, '&modified')
    call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
    return
  endif
  let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
  if !g:bclose_multiple && len(wnums) > 1
    call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
    return
  endif
  let wcurrent = winnr()
  for w in wnums
    execute w.'wincmd w'
    let prevbuf = bufnr('#')
    if prevbuf > 0 && buflisted(prevbuf) && prevbuf != btarget
      buffer #
    else
      bprevious
    endif
    if btarget == bufnr('%')
      let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
      let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
      let bjump = (bhidden + blisted + [-1])[0]
      if bjump > 0
        execute 'buffer '.bjump
      else
        execute 'enew'.a:bang
      endif
    endif
  endfor
  execute 'bdelete'.a:bang.' '.btarget
  execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call <SID>Bclose(<q-bang>, <q-args>)
