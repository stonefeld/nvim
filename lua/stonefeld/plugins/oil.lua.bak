return {
  "stevearc/oil.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
  },
  config = function()
    local oil = require("oil")

    oil.setup({
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ["<leader>o"] = "actions.close",
      },
    })

    vim.keymap.set("n", "<leader>o", oil.open)
    vim.keymap.set("n", "<leader>u", oil.discard_all_changes)
  end,
}
