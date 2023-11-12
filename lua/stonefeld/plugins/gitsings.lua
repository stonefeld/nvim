return {
  "lewis6991/gitsigns.nvim",
  opts = {
    on_attach = function()
      local gs = package.loaded.gitsigns

      vim.keymap.set("n", "]c", function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return "<Ignore>"
      end, { expr = true })

      vim.keymap.set("n", "[c", function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return "<Ignore>"
      end, { expr = true })

      vim.keymap.set("n", "<leader>hb", function()
        gs.blame_line({ full = true })
      end)
      vim.keymap.set("n", "<leader>hd", gs.diffthis)
      vim.keymap.set("n", "<leader>hp", gs.preview_hunk)
    end,
  },
}
