return {
  "stevearc/oil.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local oil = require("oil")
    local u = require("stonefeld.core.utils")

    oil.setup({
      skip_confirm_for_simple_edits = true,
    })

    u.nmap("<leader>fe", oil.open, "[Oil] Open file explorer in current buffer directory")
    u.nmap("<leader>e", function()
      oil.open(vim.fn.getcwd())
    end, "[Oil] Open file explorer in current working directory")
    u.nmap("<leader>i", oil.close, "[Oil] Close file explorer")
  end,
}
