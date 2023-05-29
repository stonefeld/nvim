function ColorMyPencils(color, transparency)
  color = color or "default"

  pcall(require, "stonefeld.colors." .. color)
  pcall(vim.cmd.colorscheme, color)

  transparency = transparency or false

  if transparency then
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end
end

ColorMyPencils("gruvbox", false)
