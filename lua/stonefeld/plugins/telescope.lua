return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-tree/nvim-web-devicons" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local action_layout = require("telescope.actions.layout")

    telescope.setup({
      defaults = {
        sorting_strategy = "ascending",
        layout_config = { prompt_position = "top" },
        results_title = false,
        mappings = {
          i = {
            -- use telescope as if it was fzf
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<ESC>"] = actions.close,

            -- toggle the preview
            ["<M-p>"] = action_layout.toggle_preview,

            -- scrolling the preview
            ["<M-k>"] = actions.preview_scrolling_up,
            ["<M-j>"] = actions.preview_scrolling_down,

            -- use default vim behavior
            ["<C-u>"] = false,
            ["<C-d>"] = false,
          },
        },
      },
      pickers = {
        buffers = {
          mappings = {
            i = {
              ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
            },
          },
        },
      },
    })
    telescope.load_extension("fzf")

    vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>", { silent = true })
    vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<CR>", { silent = true })
    vim.keymap.set("n", "<leader><Space>", ":Telescope buffers<CR>", { silent = true })
    vim.keymap.set("n", "<leader>fd", ":Telescope diagnostics<CR>", { silent = true })
    vim.keymap.set("n", "<leader>fw", ":Telescope live_grep<CR>", { silent = true })
    vim.keymap.set("n", "z=", ":Telescope spell_suggest theme=cursor<CR>", { silent = true })
  end,
}
