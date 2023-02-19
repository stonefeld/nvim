local ll_ok, ll = pcall(require, "lualine")
if ll_ok then
  local diagnostics = {
    "diagnostics",
    sections = { "error", "warn", "hint", "info" },
    symbols = { error = " ", warn = " ", hint = " ", info = " " },
    colored = false,
    color = { gui = "" },
    updated_in_insert = false,
    always_visible = true,
  }

  local mode = {
    "mode",
    fmt = function(str)
      return "-- " .. str .. " --"
    end,
  }

  local spaces = function()
    if vim.o.expandtab then
      return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
    end
    return "tabs: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
  end

  ll.setup({
    options = {
      icons_enabled = true,
      component_separators = "",
      section_separators = "",
      disabled_filetypes = { "TelescopePrompt" },
    },
    sections = {
      lualine_a = { "branch", diagnostics },
      lualine_b = { mode },
      lualine_c = {},
      lualine_x = { "diff", spaces, "encoding", "filetype" },
    },
  })
end

local bl_ok, bl = pcall(require, "bufferline")
if bl_ok then
  bl.setup({
    options = {
      show_close_icon = false,
      show_buffer_close_icons = false,
    },
  })
end

local nv_ok, nv = pcall(require, "nvim-navic")
if nv_ok then
  nv.setup({
    highlight = true,
  })

  vim.o.winbar = " %{%v:lua.require'nvim-navic'.get_location()%}"
end
