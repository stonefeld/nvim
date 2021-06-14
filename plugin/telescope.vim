" ---------- Telescope ---------- "
" Keybindings.
" nnoremap <silent> <C-p> :lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>
" nnoremap <silent> <leader>pa :lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({ previewer = false }))<CR>
" nnoremap <silent> <leader>pd :lua require('telescope.builtin').lsp_document_diagnostics(require('telescope.themes').get_dropdown())<CR>
