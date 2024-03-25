-- set leader key to space
vim.g.mapleader = " "

-- define a more simple way to map keys
local map = function(mode, keys, func, desc)
  vim.keymap.set(mode, keys, func, { silent = true, desc = desc or "" })
end

-- space by default shouldn't do nothing
map({ "n", "v" }, "<Space>", "<Nop>")

-- move lines without cutting
map("v", "J", ":m '>+1<CR>gv", "Move selected lines down")
map("v", "K", ":m '<-2<CR>gv", "Move selected lines up")

-- open netrw
map("n", "<leader>e", ":Ex<CR>", "Open Netrw [E]xplorer")

-- managing buffers
map("n", "<Tab>", ":bn<CR>", "Navigate bufferlist forward")
map("n", "<S-Tab>", ":bp<CR>", "Navigate bufferlist backward")
map("n", "<leader>x", ":bp | sp | bn | bd<CR>", "Close buffer but not windows")

-- open current buffer in a new tab
map("n", "<leader>te", ":tabe %<CR>", "Open current buffer in a new tab")

-- navigating through diagnostics
map("n", "gl", vim.diagnostic.open_float, "Open diagnostics float")
map("n", "]d", vim.diagnostic.goto_next, "Navigate diagnostics forward")
map("n", "[d", vim.diagnostic.goto_prev, "Navigate diagnostics backward")

-- manipulate the quickfix
map("n", "]q", ":cnext<CR>", "Navigate quickfix list forward")
map("n", "[q", ":cprev<CR>", "Navigate quickfix list backward")
map("n", "<leader>q", ":ccl<CR>", "Close quickfix list")

-- using the clipboard
map({ "n", "v" }, "<leader>p", '"+p', "Paste from clipboard")
map({ "n", "v" }, "<leader>y", '"+y', "Yank to clipboard")
map("n", "<leader>Y", '"+y$', "Yank to clipboard until the end of line")

-- don't modify the registers
map("v", "<leader>P", '"_dP', "Paste without modifying the registers")
map({ "n", "v" }, "<leader>d", '"_d', "Delete without modifying the registers")

-- search the selected text
map("v", "<leader>/", 'y/<C-R>"<CR>', "Search the selected text")

-- toggle some useful values
map("n", "<Esc>", ":nohls<CR>", "Clear search highlights")
map("n", "<leader>s", ":set spell!<CR>", "Toggle spell checking")
map("n", "<leader>w", function()
  vim.o.wrap = not vim.o.wrap
  if vim.o.wrap then
    vim.keymap.set({ "n", "v" }, "j", "gj", { buffer = 0 })
    vim.keymap.set({ "n", "v" }, "k", "gk", { buffer = 0 })
    vim.keymap.set({ "n", "v" }, "$", "g$", { buffer = 0 })
    vim.keymap.set({ "n", "v" }, "0", "g0", { buffer = 0 })
  else
    vim.keymap.del({ "n", "v" }, "j", { buffer = 0 })
    vim.keymap.del({ "n", "v" }, "k", { buffer = 0 })
    vim.keymap.del({ "n", "v" }, "$", { buffer = 0 })
    vim.keymap.del({ "n", "v" }, "0", { buffer = 0 })
  end
end, "Toggle line wrapping")
