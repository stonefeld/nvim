" ---------- LSP ---------- "
" Autocomplete options.
set complete+=kspell
set completeopt=menuone,noinsert,noselect,preview

" Set python path.
if filereadable('$PYENV_ROOT/versions/neovim3.9.1/bin/python')
  let g:python3_host_prog='$PYENV_ROOT/versions/neovim3.9.1/bin/python'
endif
if filereadable('$PYENV_ROOT/versions/neovim2.7.18/bin/python')
  let g:python_host_prog='$PYENV_ROOT/versions/neovim2.7.18/bin/python'
endif

" Toggle quickfix window.
fu! QFixToggle(forced)
  if exists('g:qfix_win') && a:forced == 0
    exe 'ccl'
    unlet g:qfix_win
  else
    if exists('g:lspconfig')
      exe 'lua vim.lsp.diagnostic.set_qflist()'
    else
      exe 'copen'
    endif
    let g:qfix_win = bufnr('$')
  endif
endfu
