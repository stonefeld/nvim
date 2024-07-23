return {
  "lewis6991/gitsigns.nvim",
  opts = {
    -- signs = {
    --   add = { text = "│" },
    --   change = { text = "│" },
    --   delete = { text = "_" },
    --   topdelete = { text = "‾" },
    --   changedelete = { text = "~" },
    --   untracked = { text = "┊" },
    -- },
    on_attach = function(bufnr)
      local gitsigns = package.loaded.gitsigns

      local map = function(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        opts.desc = opts.desc and "[Gitsigns] " .. opts.desc or ""
        vim.keymap.set(mode, l, r, opts)
      end

      map({ "n", "v" }, "]c", function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          gitsigns.next_hunk()
        end)
        return "<Ignore>"
      end, { expr = true, desc = "Navigate to the next hunk" })

      map({ "n", "v" }, "[c", function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          gitsigns.prev_hunk()
        end)
        return "<Ignore>"
      end, { expr = true, desc = "Navigate to the previous hunk" })

      map("v", "<leader>hs", function()
        gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "Stage selected lines" })
      map("v", "<leader>hr", function()
        gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "Reset selected lines" })

      map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage the current hunk" })
      map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset the current hunk" })
      map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "Stage the whole buffer" })
      map("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "Undo stage the current hunk" })
      map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "Reset the whole buffer" })
      map("n", "<leader>hi", gitsigns.preview_hunk_inline, { desc = "Preview the current hunk inline" })
      map("n", "<leader>hb", gitsigns.blame, { desc = "Blame the current line" })

      map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle current line blame" })
      map("n", "<leader>td", gitsigns.toggle_deleted, { desc = "Toggle deleted" })
    end,
  },
}
