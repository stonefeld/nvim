return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local trouble = require("trouble")

    trouble.setup({
      padding = false,
      cycle_results = false,
      indent_lines = false,
      auto_preview = false,
      use_diagnostic_signs = true,
    })

    vim.keymap.set("n", "<leader>wd", function()
      trouble.toggle("diagnostics")
    end, { desc = "Toggle diagnostics" })
  end,
}
