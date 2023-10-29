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

    telescope.setup({
      defaults = {
        sorting_strategy = "ascending",
        layout_config = {
          prompt_position = "top",
        },
        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<ESC>"] = actions.close,
          },
        },
      },
      pickers = {
        buffers = {
          mappings = {
            i = { ["<C-d>"] = actions.delete_buffer },
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
  end,
}
