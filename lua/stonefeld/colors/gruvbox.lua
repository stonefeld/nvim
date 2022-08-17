-- ---------- Gruvbox ---------- --
local status_ok, gb = pcall(require, "gruvbox")
if not status_ok then
  return
end

local col = require("gruvbox.palette")
gb.setup({
  contrast = "hard",
  italic = false,
  overrides = {
    Normal = { bg = "NONE" },
    DiffDelete = { fg = col.dark0_hard, bg = col.bright_red, reverse = false },
    DiffText = { fg = col.dark0_hard, bg = col.bright_yellow, reverse = false },
    DiffAdd = { fg = col.dark0_hard, bg = col.bright_green, reverse = false },
    DiffChange = { fg = col.dark0_hard, bg = col.bright_blue, reverse = false },
    StatusLineAccent = { fg = col.dark0_hard, bg = col.bright_yellow },
    StatusLineAccentInsert = { fg = col.dark0_hard, bg = col.bright_orange },
    StatusLineAccentVisual = { fg = col.dark0_hard, bg = col.bright_purple },
    StatusLineAccentReplace = { fg = col.dark0_hard, bg = col.bright_red },
    StatusLineAccentCmd = { fg = col.dark0_hard, bg = col.bright_green },
    StatusLineAccentExtra = { fg = col.dark0_hard, bg = col.bright_aqua },
  }
})
