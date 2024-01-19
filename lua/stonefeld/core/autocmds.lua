local augs = {}

-- format the file
augs.formatting = {
  clean_whitespace = {
    event = "BufWritePre",
    pattern = "*",
    command = [[
      let curr_pos=getpos('.')
      exe '%s/\s\+$//e'
      call cursor(curr_pos[1], curr_pos[2])
    ]],
  },
}

-- set correct filetype for some extensions
augs.set_filetypes = {
  set_h_ft = {
    event = { "BufNewfile", "BufRead" },
    pattern = "*.h",
    command = [[ setl ft=c ]],
  },
  set_tex_ft = {
    event = { "BufNewFile", "BufRead" },
    pattern = "*.tex",
    command = [[ setl ft=tex ]],
  },
  set_asm_ft = {
    event = { "BufNewFile", "BufRead" },
    pattern = "*.asm",
    command = [[ setl ft=nasm ]],
  },
}

-- set specific keymaps for some filetypes
augs.filetype_keymaps = {
  q_to_close = {
    event = "FileType",
    pattern = { "qf", "help" },
    callback = function()
      vim.keymap.set("n", "q", ":q<CR>", { buffer = 0, silent = true })
    end,
  },
}

-- miscellaneous
augs.misc = {
  visual_yank = {
    event = "TextYankPost",
    pattern = "*",
    callback = function()
      vim.highlight.on_yank()
    end,
  },
}

-- create autocommands from augs table
for group, commands in pairs(augs) do
  local augroup = vim.api.nvim_create_augroup(group, { clear = true })
  for _, opts in pairs(commands) do
    local event = opts.event
    opts.event = nil
    opts.group = augroup
    vim.api.nvim_create_autocmd(event, opts)
  end
end
