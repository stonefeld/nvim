return {
  "goolord/alpha-nvim",
  requires = {
    { "nvim-tree/nvim-web-devicons" },
    { "nvim-lua/plenary.nvim" },
  },
  config = function()
    local alpha = require("alpha")
    local theta = require("alpha.themes.theta")

    alpha.setup(theta.config)
  end,
}
