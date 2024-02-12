return {
  "lewis6991/gitsigns.nvim",
  opts = {
    on_attach = function()
      local gitsigns = require("gitsigns")

      gitsigns.setup({
        preview_config = { border = "rounded" },
      })

      vim.keymap.set("n", "]g", function()
        if vim.wo.diff then
          return "]g"
        end
        vim.schedule(function()
          gitsigns.next_hunk()
        end)
        return "<Ignore>"
      end, { expr = true })

      vim.keymap.set("n", "[g", function()
        if vim.wo.diff then
          return "[g"
        end
        vim.schedule(function()
          gitsigns.prev_hunk()
        end)
        return "<Ignore>"
      end, { expr = true })

      vim.keymap.set("n", "<leader>gb", function()
        gitsigns.blame_line({ full = true })
      end)
      vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk)
      vim.keymap.set("n", "<leader>gd", gitsigns.diffthis)
    end,
  },
}
