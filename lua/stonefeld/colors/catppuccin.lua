local cp_ok, cp = pcall(require, "catppuccin")
if not cp_ok then
  return
end

cp.setup({
  integrations = {
    fidget = true,
    navic = {
      enabled = true,
      custom_bg = "NONE",
    },
  },
})
