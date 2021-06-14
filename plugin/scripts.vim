" ---------- Scripts ---------- "
" A simple function to print active buffers and display a prompt to type the
" corresponding nummber of the buffer the user wants to jump to.
function! JumpToBuffer()
  :buffers
  let b:num = input('Enter buffer number: ')
  :execute 'b' . b:num
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

" Command ':Bclose' executes ':bd' to delete buffer in current window.
" The window will show the alternate buffer (Ctrl-^) if it exists,
" or the previous buffer (:bp), or a blank buffer if no previous.
" Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
" An optional argument can specify which buffer to close (name or number).
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
  " Numbers of windows that view target buffer which we will delete.
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
      " Numbers of listed buffers which are not the target to be deleted.
      let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
      " Listed, not target, and not displayed.
      let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
      " Take the first buffer, if any (could be more intelligent).
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

" Goto the selected terminal.
function! GoToBuffer(ctrlId)
  if (a:ctrlId > 9) || (a:ctrlId < 0)
    echo "CtrlID must be between 0 - 9"
    return
  end

  let contents = g:win_ctrl_buf_list[a:ctrlId]
  if type(l:contents) != v:t_list
    echo "Nothing There"
    return
  end

  let bufh = l:contents[1]
  call nvim_win_set_buf(0, l:bufh)
endfunction

let g:win_ctrl_buf_list = [0, 0, 0, 0]
function! SetBuffer(ctrlId)
  if has_key(b:, "terminal_job_id") == 0
    echo "You must be in a terminal to execute this ommand"
    return
  end

  if (a:ctrlId > 9) || (a:ctrlId < 0)
    echo "CtrlID must be between 0 - 9"
    return
  end

  let g:win_ctrl_buf_list[a:ctrlId] = [b:terminal_job_id, nvim_win_get_buf(0)]
endfunction

function! SendTerminalCommand(ctrlId, command)
  if (a:ctrlId > 9) || (a:ctrlId < 0)
    echo "CtrlID must be between 0 - 9"
    return
  end

  let contents = g:win_ctrl_buf_list[a:ctrlId]
  if type(l:contents) != v:t_list
    echo "Nothing There"
    return
  end

  let job_id = l:contents[0]
  call chansend(job_id, command)
endfunction
