local augs = {}
local u = require("stonefeld.core.utils")

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
  set_angular_ft = {
    event = { "BufNewFile", "BufRead" },
    pattern = "*.component.html",
    desc = "Use Angular for Angular files",
    command = [[ setl ft=htmlangular ]],
  },
  set_pandoc_ft = {
    event = { "BufNewFile", "BufRead" },
    pattern = "*.md",
    desc = "Use Pandoc for Markdown files",
    command = [[ setl ft=markdown.pandoc ]],
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
  compile_markdown = {
    event = "FileType",
    pattern = "markdown.pandoc",
    desc = "Compile markdown files",
    callback = function()
      u.nmap("<M-m>", ":w | make<CR>", "[Core] Compile markdown file", { buffer = 0 })
      u.nmap("<M-o>", function()
        local file = vim.fn.expand("%:p:r")
        vim.fn.jobstart("xdg-open " .. file .. ".pdf", { detach = true })
      end, "[Core] Open generated PDF", { buffer = 0 })

      u.nmap("j", "gj", "[Core] Move in wrapped lines", { buffer = 0 })
      u.nmap("k", "gk", "[Core] Move in wrapped lines", { buffer = 0 })
      u.nmap("$", "g$", "[Core] Move in wrapped lines", { buffer = 0 })
      u.nmap("0", "g0", "[Core] Move in wrapped lines", { buffer = 0 })
    end,
  },
}

augs.CoreFiletypeSettings = {
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
  markdown_styles = {
    event = "FileType",
    pattern = "markdown.pandoc",
    desc = "Set markdown styles",
    callback = function()
      vim.opt_local.wrap = true
      vim.opt_local.breakindent = false
      vim.opt_local.number = false
      vim.opt_local.relativenumber = false
      vim.opt_local.textwidth = 80
      vim.opt_local.colorcolumn = "81"
      vim.opt_local.spell = true
      vim.opt_local.makeprg = "mdc %"
    end,
  },
  wrap_on_dap_windows = {
    event = "FileType",
    pattern = { "dap-repl", "dapui_console" },
    desc = "Wrap lines on DAP windows",
    callback = function()
      vim.opt_local.wrap = true
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
