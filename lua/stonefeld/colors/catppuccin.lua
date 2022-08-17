-- ---------- Catppuccin ---------- --
local status_ok, cp = pcall(require, "catppuccin")
if not status_ok then
  return
end

local col = require("catppuccin.palettes").get_palette()
cp.setup({
  transparent_background = true,
  integrations = {
    dap = {
      enabled = true,
      enable_ui = true,
    },
  },
  custom_highlights = {
    DiffDelete = { fg = col.base, bg = col.red },
    DiffText = { fg = col.base, bg = col.yellow },
    DiffAdd = { fg = col.base, bg = col.green },
    DiffChange = { fg = col.base, bg = col.blue },
    StatusLineAccent = { fg = col.base, bg = col.yellow },
    StatusLineAccentInsert = { fg = col.base, bg = col.peach },
    StatusLineAccentVisual = { fg = col.base, bg = col.mauve },
    StatusLineAccentReplace = { fg = col.base, bg = col.red },
    StatusLineAccentCmd = { fg = col.base, bg = col.green },
    StatusLineAccentExtra = { fg = col.base, bg = col.sky },
  },
})
