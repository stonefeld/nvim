local augs = {}

-- format the file
augs.CoreFormatting = {
  clean_whitespace = {
    event = "BufWritePre",
    pattern = "*",
    desc = "Clean all trailing whitespace when saving",
    callback = function()
      local pos = vim.api.nvim_win_get_cursor(0)
      vim.cmd([[ %s/\s\+$//e ]])
      vim.api.nvim_win_set_cursor(0, pos)
    end,
  },
}

-- set correct filetype for some extensions
augs.CoreSetFiletypes = {
  set_h_ft = {
    event = { "BufNewfile", "BufRead" },
    pattern = "*.h",
    desc = "All .h files are C headers",
    command = [[ setl ft=c ]],
  },
  set_tex_ft = {
    event = { "BufNewFile", "BufRead" },
    pattern = "*.tex",
    desc = "All .tex are LaTeX files",
    command = [[ setl ft=tex ]],
  },
  set_asm_ft = {
    event = { "BufNewFile", "BufRead" },
    pattern = "*.asm",
    desc = "Use NASM for Assembly files",
    command = [[ setl ft=nasm ]],
  },
}

-- set specific keymaps for some filetypes
augs.CoreFiletypeKeymaps = {
  q_to_close = {
    event = "FileType",
    pattern = { "qf", "help", "gitsigns.blame" },
    desc = "Close some windows quicker",
    callback = function()
      vim.keymap.set("n", "q", ":q<CR>", { buffer = 0, silent = true })
    end,
  },
  q_to_close_netrw = {
    event = "FileType",
    pattern = "netrw",
    desc = "Close netrw",
    callback = function()
      vim.keymap.set("n", "<leader>e", ":b#<CR>", { buffer = 0, silent = true })
    end,
  },
}

-- extras
augs.CoreExtras = {
  visual_yank = {
    event = "TextYankPost",
    pattern = "*",
    desc = "Highlight when yanking text",
    callback = function()
      vim.highlight.on_yank()
    end,
  },
  quickfix_styles = {
    event = "FileType",
    pattern = "qf",
    desc = "Set quickfix window styles",
    callback = function()
      vim.opt_local.number = false
      vim.opt_local.relativenumber = false
      vim.opt_local.colorcolumn = ""
    end,
  },
  disable_folds = {
    event = "FileType",
    pattern = { "NeogitStatus", "NeogitDiffView", "NeogitCommitView" },
    desc = "Disable fold column for neogit status",
    callback = function()
      vim.opt_local.foldcolumn = "0"
    end,
  },
}

-- create all autogroups and autocmds dynamically
for group, commands in pairs(augs) do
  local augroup = vim.api.nvim_create_augroup(group, { clear = true })
  for _, options in pairs(commands) do
    local event = options.event
    options.event = nil
    options.group = augroup
    vim.api.nvim_create_autocmd(event, options)
  end
end
