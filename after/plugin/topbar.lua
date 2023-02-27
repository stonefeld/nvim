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
