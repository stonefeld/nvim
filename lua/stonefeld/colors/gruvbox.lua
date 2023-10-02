local gb_ok, gb = pcall(require, "gruvbox")
if not gb_ok then
  return
end

local colors = require("gruvbox.palette").get_base_colors()

gb.setup({
  contrast = "hard",
  italic = {
    strings = false,
  },
  overrides = {
    IndentBlankLineChar = { fg = colors.bg1 },
    IndentBlankLineContextChar = { fg = colors.bg4 },
  },
})
