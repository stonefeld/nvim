return {
  "akinsho/bufferline.nvim",
  dependencies = {
    { "catppuccin/nvim" },
  },
  after = "catppuccin",
  config = function()
    local catppuccin_theme = require("catppuccin.groups.integrations.bufferline")
    require("bufferline").setup({
      highlights = catppuccin_theme.get(),
    })

    local opts = { silent = true }
    vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
    vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)
    vim.keymap.set("n", "]b", ":BufferLineMoveNext<CR>", opts)
    vim.keymap.set("n", "[b", ":BufferLineMovePrev<CR>", opts)
    vim.keymap.set("n", "<leader>be", ":BufferLineSortByExtension<CR>", opts)
    vim.keymap.set("n", "<leader>bd", ":BufferLineSortByDirectory<CR>", opts)
    vim.keymap.set("n", "<leader>bp", ":BufferLineTogglePin<CR>", opts)
  end,
}
