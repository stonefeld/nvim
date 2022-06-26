-- ---------- Autocommands ---------- --
-- Autogroups table
local augroups = {}

-- Clean and format the current buffer
augroups.buf_write_pre = {
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

-- Based on certain filetypes
augroups.filetype_behaviour = {
  set_term_ft = {
    event = "TermOpen",
    pattern = "term://*",
    command = [[ setl ft=term ]],
  },

  set_html_ft = {
    event = { "BufNewFile", "BufRead" },
    pattern = "*.html",
    command = [[ setl ft=html ]],
  },

  set_tex_ft = {
    event = { "BufNewFile", "BufRead" },
    pattern = "*.tex",
    command = [[ setl ft=tex ]],
  },
}

-- Miscellaneous
augroups.misc = {
  visual_yank = {
    event = "TextYankPost",
    pattern = "*",
    callback = function()
      vim.highlight.on_yank({ higroup="IncSearch", timeout=150, on_visual=true })
    end,
  },
}

-- Create autocommands from augroups table
for group, commands in pairs(augroups) do
  local augroup = vim.api.nvim_create_augroup(group, { clear = true })
  for _, opts in pairs(commands) do
    local event = opts.event
    opts.event = nil
    opts.group = augroup
    vim.api.nvim_create_autocmd(event, opts)
  end
end
