return {
  "lewis6991/gitsigns.nvim",
  opts = {
    on_attach = function()
      local gitsigns = require("gitsigns")

      gitsigns.setup({
        preview_config = { border = "rounded" },
      })

      vim.keymap.set("n", "]c", function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          gitsigns.next_hunk()
        end)
        return "<Ignore>"
      end, { expr = true })

      vim.keymap.set("n", "[c", function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          gitsigns.prev_hunk()
        end)
        return "<Ignore>"
      end, { expr = true })

      vim.keymap.set("n", "<leader>hb", function()
        gitsigns.blame_line({ full = true })
      end)
      vim.keymap.set("n", "<leader>hd", gitsigns.diffthis)
      vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk)
    end,
  },
}
