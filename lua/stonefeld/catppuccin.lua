-- ---------- Catppuccin ---------- --
local status_ok, cp = pcall(require, "catppuccin")
if not status_ok then
  return
end

cp.setup {
  transparent_background = true,
  term_colors = true,
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
    },
    cmp = true,
    telescope = true,
  }
}

local colors = require("catppuccin.api.colors").get_colors()
cp.remap({
  StatusLine = { fg = colors.crust, bg = colors.blue },
  StatusLineAccent = { fg = colors.yellow, bg = colors.none },
  StatusLineAccentInsert = { fg = colors.peach, bg = colors.none },
  StatusLineAccentVisual = { fg = colors.lavender, bg = colors.none },
  StatusLineAccentReplace = { fg = colors.red, bg = colors.none },
  StatusLineAccentCmd = { fg = colors.green, bg = colors.none },
  DiagnosticError = { fg = colors.red, bg = colors.none },
  DiagnosticSignError = { fg = colors.red, bg = colors.none },
  DiagnosticSignWarn = { fg = colors.yellow, bg = colors.none },
  DiagnosticSignInfo = { fg = colors.blue, bg = colors.none },
  DiagnosticSignHint = { fg = colors.green, bg = colors.none },
  DiagnosticFloatingError = { fg = colors.red, bg = colors.none },
  DiagnosticFloatingWarn = { fg = colors.yellow, bg = colors.none },
  DiagnosticFloatingInfo = { fg = colors.blue, bg = colors.none },
  DiagnosticFloatingHint = { fg = colors.green, bg = colors.none },
})
