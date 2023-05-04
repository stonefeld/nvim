local vs_ok, vs = pcall(require, "vscode")
if not vs_ok then
  return
end

local c = require("vscode.colors").get_colors()
vs.setup({
  group_overrides = {
    ["@punctuation.bracket"] = { fg = c.vscDarkYellow, bold = true },
  },
})

vs.load()
