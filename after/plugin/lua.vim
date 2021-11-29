" ---------- Lua ---------- "
" Load lsp lua config, if lspconfig is available.
if exists('g:lspconfig')
  lua require('stonefeld.lsp')
endif

" Load treesitter lua config, if treesitter is available.
if exists('g:loaded_nvim_treesitter')
  lua require('stonefeld.treesitter')
endif

" Load cmp lua config, if nvim-cmp is available.
if exists('g:loaded_cmp')
  lua require('stonefeld.cmp')
endif
