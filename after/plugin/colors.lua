function ColorMyPencils(color)
  color = color or "catppuccin"

  pcall(require, "stonefeld.colors." .. color)
  pcall(vim.cmd.colorscheme, color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
