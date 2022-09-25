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
  compile = {
    enabled = true,
    path = vim.fn.stdpath("cache") .. "/catppuccin"
  },
  custom_highlights = {
    StlAcc = { fg = col.base, bg = col.blue },
    StlAccInsert = { fg = col.base, bg = col.green },
    StlAccVisual = { fg = col.base, bg = col.mauve },
    StlAccReplace = { fg = col.base, bg = col.red },
    StlAccCmd = { fg = col.base, bg = col.yellow },
    StlAccExtra = { fg = col.base, bg = col.sky },
    StlWhite = { fg = col.white, bg = col.mantle, style = { "bold" } },
    StlRed = { fg = col.red, bg = col.mantle, style = { "bold" } },
    StlYellow = { fg = col.yellow, bg = col.mantle, style = { "bold" } },
    StlGreen = { fg = col.green, bg = col.mantle, style = { "bold" } },
    StlBlue = { fg = col.blue, bg = col.mantle, style = { "bold" } },
    StlPurple = { fg = col.mauve, bg = col.mantle, style = { "bold" } },
  },
})
