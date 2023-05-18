local gb_ok, gb = pcall(require, "gruvbox")
if not gb_ok then
  return
end

gb.setup({
  contrast = "hard",
  italic = {
    strings = false,
  },
})
