local colors = "kanagawa"
local set_colors = function(colorscheme)
  if colors == colorscheme then
    return function()
      vim.cmd.colorscheme(colorscheme)
    end
  end
  return nil
end

return {
  {
    "catppuccin/nvim",
    priority = 1000,
    name = "catppuccin",
    init = set_colors("catppuccin"),
    opts = {
      no_italic = true,
      background = { dark = "mocha" },
    },
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    init = set_colors("gruvbox"),
    opts = {
      italic = {
        strings = false,
        comments = false,
      },
    },
  },
  {
    "deparr/tairiki.nvim",
    priority = 1000,
    name = "tairiki",
    init = set_colors("tairiki"),
    opts = {
      diagnostics = { darker = true },
      plugins = { auto = true },
    },
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    init = set_colors("kanagawa"),
    opts = {
      overrides = function(colors)
        local theme = colors.theme
        local makeDiagnosticColor = function(color)
          local c = require("kanagawa.lib.color")
          return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
        end

        return {
          DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
          DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
          DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
          DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
        }
      end,
    },
  },
}
