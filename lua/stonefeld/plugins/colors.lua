return {
  "rebelot/kanagawa.nvim",
  priority = 1000,
  init = function()
    vim.cmd.colorscheme("kanagawa")
  end,
  opts = {
    compile = true,
    overrides = function(colors)
      local theme = colors.theme
      local make_diagnostic_color = function(color)
        local c = require("kanagawa.lib.color")
        return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
      end

      return {
        DiagnosticVirtualTextError = make_diagnostic_color(theme.diag.error),
        DiagnosticVirtualTextWarn = make_diagnostic_color(theme.diag.warning),
        DiagnosticVirtualTextInfo = make_diagnostic_color(theme.diag.info),
        DiagnosticVirtualTextHint = make_diagnostic_color(theme.diag.hint),
      }
    end,
  },
}
