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

-- change options for filetypes
augs.filetype_options = {
  markup_options = {
    event = "FileType",
    pattern = { "tex", "markdown" },
    callback = function()
      vim.opt_local.tabstop = 2
      vim.opt_local.softtabstop = 2
      vim.opt_local.shiftwidth = 2
      vim.opt_local.expandtab = true
      vim.opt_local.wrap = true

      vim.keymap.set({ "n", "v" }, "j", "gj", { silent = true })
      vim.keymap.set({ "n", "v" }, "k", "gk", { silent = true })
      vim.keymap.set({ "n", "v" }, "0", "g0", { silent = true })
      vim.keymap.set({ "n", "v" }, "$", "g$", { silent = true })
    end,
  },
  c_indent_options = {
    event = "FileType",
    pattern = { "c", "cpp", "arduino" },
    callback = function()
      vim.opt_local.expandtab = false
      vim.opt_local.cindent = true
      vim.opt_local.cinoptions = "(0,W4,w1,m1,l1,t0,g0"
    end,
  },
}

-- set specific keymaps for some filetypes
augs.filetype_keymaps = {
  compile_markdown = {
    event = "FileType",
    pattern = { "markdown" },
    callback = function()
      vim.keymap.set("n", "<m-m>", ":w! | exe '!compiler ' . expand('%:p')<cr>")
      vim.keymap.set("n", "<m-o>", ":exe '!xdg-open ' . expand('%:r') . '.pdf &' | redraw!<cr>")
    end,
  },
  q_to_close = {
    event = "FileType",
    pattern = { "qf", "help" },
    callback = function()
      vim.keymap.set("n", "q", ":q<cr>", { buffer = 0, silent = true })
    end,
  },
}

-- miscellaneous
augs.misc = {
  visual_yank = {
    event = "TextYankPost",
    pattern = "*",
    callback = function()
      vim.highlight.on_yank({
        higroup = "IncSearch",
        timeout = 150,
      })
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
