local ll_ok, ll = pcall(require, "lualine")
if not ll_ok then
  return
end

local diagnostics = {
  "diagnostics",
  symbols = { error = " ", warn = " ", hint = " ", info = " " },
  fmt = function(str)
    return " " .. str
  end,
}

local mode = {
  "mode",
  fmt = function(str)
    return "-- " .. str .. " --"
  end,
}

local spaces = function()
  local size = vim.api.nvim_buf_get_option(0, "shiftwidth")
  if vim.api.nvim_buf_get_option(0, "expandtab") then
    return "spaces: " .. size
  end
  return "tabs: " .. size
end

ll.setup({
  options = {
    icons_enabled = true,
    component_separators = "",
    section_separators = "",
    disabled_filetypes = { "TelescopePrompt" },
  },
  sections = {
    lualine_a = { "branch" },
    lualine_b = { mode },
    lualine_c = { diagnostics },
    lualine_x = { "diff", spaces, "encoding", "filetype" },
  },
})
