local ll_ok, ll = pcall(require, "lualine")
if not ll_ok then
  return
end

ll.setup({
  options = {
    icons_enabled = true,
    component_separators = "|",
    section_separators = "",
    disabled_filetypes = { "TelescopePrompt" },
  },
})
