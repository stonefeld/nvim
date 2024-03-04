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

    vim.keymap.set("n", "<leader>tt", trouble.toggle)
    vim.keymap.set("n", "<leader>td", function()
      trouble.toggle("document_diagnostics")
    end)
    vim.keymap.set("n", "<leader>tw", function()
      trouble.toggle("workspace_diagnostics")
    end)
  end,
}
