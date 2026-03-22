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

      local error = make_diagnostic_color(theme.diag.error)
      local warning = make_diagnostic_color(theme.diag.warning)
      local info = make_diagnostic_color(theme.diag.info)
      local hint = make_diagnostic_color(theme.diag.hint)

      return {
        DiagnosticVirtualTextError = error,
        DiagnosticVirtualTextWarn = warning,
        DiagnosticVirtualTextInfo = info,
        DiagnosticVirtualTextHint = hint,
        DiagnosticErrorLn = { fg = "NONE", bg = error.bg },
        DiagnosticWarnLn = { fg = "NONE", bg = warning.bg },
        DiagnosticInfoLn = { fg = "NONE", bg = info.bg },
        DiagnosticHintLn = { fg = "NONE", bg = hint.bg }
      }
    end,
  },
}
