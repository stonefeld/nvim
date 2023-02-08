local augs = {}

augs.buf_write_pre = {
  clean_whitespace = {
    event = "BufWritePre",
    pattern = "*",
    command = [[
      let curr_pos=getpos('.')
      exe '%s/\s\+$//e'
      call cursor(curr_pos[1], curr_pos[2])
    ]],
  },

  c_style_format = {
    event = "BufWritePre",
    pattern = { "*.c", "*.cpp" },
    command = [[
      let curr_pos=getpos('.')
      exe '%s/\<if(/if (/e'
      exe '%s/\<for(/for (/e'
      exe '%s/\<while(/while (/e'
      exe '%s/\<switch(/switch (/e'
      exe '%s/}break;/} break;/e'
      call cursor(curr_pos[1], curr_pos[2])
    ]],
  },
}

-- set correct filetype for some extensions
augs.set_filetypes = {
  set_term_ft = {
    event = "TermOpen",
    pattern = "term://*",
    command = [[ setl ft=term ]],
  },

  set_tex_ft = {
    event = { "BufNewFile", "BufRead" },
    pattern = "*.tex",
    command = [[ setl ft=tex ]],
  },
}

-- change options for filetypes
augs.filetype_options = {
  two_space_indent = {
    event = "FileType",
    pattern = {
      "arduino",
      "css",
      "html",
      "htmldjango",
      "javascript",
      "javascriptreact",
      "json",
      "jsonc",
      "lua",
      "markdown",
      "rmd",
      "tex",
      "typescript",
      "typescriptreact",
      "vim",
      "xml",
      "xquery",
      "xsd",
      "xslt",
      "yaml",
    },
    callback = function()
      vim.opt_local.tabstop = 2
      vim.opt_local.softtabstop = 2
      vim.opt_local.shiftwidth = 2
      vim.opt_local.expandtab = true
    end,
  },

  html_no_tw = {
    event = "FileType",
    pattern = { "html", "htmldjango", "css" },
    callback = function()
      vim.opt_local.textwidth = 0
    end,
  },

  markdown_folding = {
    event = "FileType",
    pattern = { "markdown", "rmd" },
    callback = function()
      vim.opt_local.foldenable = true
      vim.opt_local.foldmethod = "marker"
      vim.opt_local.foldmarker = "<!-- {{{ -->,<!-- }}} -->"
    end,
  },

  latex_folding = {
    event = "FileType",
    pattern = "tex",
    callback = function()
      vim.opt_local.foldenable = true
      vim.opt_local.foldmethod = "marker"
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

  qf_window_style = {
    event = "FileType",
    pattern = "qf",
    callback = function()
      vim.opt_local.number = false
      vim.opt_local.relativenumber = false
    end,
  },
}

-- set specific keymaps for some filetypes
augs.filetype_keymaps = {
  compile_markdown_and_tex = {
    event = "FileType",
    pattern = { "markdown", "tex" },
    callback = function()
      vim.keymap.set("n", "<m-m>", "<cmd>w! | execute '!compiler ' . expand('%:p')<cr>")
      vim.keymap.set("n", "<m-o>", "<cmd> execute '!xdg-open ' . expand('%:r') . '.pdf &' | redraw!<cr>")
    end,
  },

  compile_rmd = {
    event = "FileType",
    pattern = "rmd",
    callback = function()
      vim.keymap.set("n", "<m-m>", "<cmd>w! | !echo \"require(rmarkdown); render('%')\" | R --vanilla<cr>")
      vim.keymap.set("n", "<m-o>", "<cmd>exe '!xdg-open ' . expand('%:r') . '.pdf &' | redraw!<cr>")
    end,
  },

  q_to_close = {
    event = "FileType",
    pattern = "qf",
    callback = function()
      vim.keymap.set("n", "q", "<cmd>q<cr>")
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
