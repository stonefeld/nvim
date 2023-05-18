local tl_ok, tl = pcall(require, "telescope")
if not tl_ok then
  return
end

local actions = require("telescope.actions")

tl.setup({
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
        ["<Esc>"] = actions.close,
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

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<C-p>", builtin.find_files)
vim.keymap.set("n", "<leader>fo", builtin.oldfiles)
vim.keymap.set("n", "<leader>?", builtin.help_tags)
vim.keymap.set("n", "<leader><Space>", builtin.buffers)
vim.keymap.set("n", "<leader>fd", builtin.diagnostics)
vim.keymap.set("n", "<leader>fw", builtin.live_grep)
vim.keymap.set("n", "<leader>fq", builtin.quickfix)
vim.keymap.set("n", "<leader>fh", builtin.quickfixhistory)

pcall(tl.load_extension("fzf"))
