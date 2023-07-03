local cp_ok, cp = pcall(require, "catppuccin")
if not cp_ok then
  return
end

cp.setup({
  term_colors = false,
  integrations = {
    fidget = true,
    mason = true,
  },
})
