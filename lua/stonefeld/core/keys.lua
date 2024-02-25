-- set leader key to space
vim.g.mapleader = " "

-- space by default shouldn't do nothing
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- move lines without cutting
vim.keymap.set("v", "J", ":m '>+1<CR>gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv", { silent = true })

-- open netrw
vim.keymap.set("n", "<leader>e", ":Ex<CR>", { silent = true })

-- managing buffers
vim.keymap.set("n", "<Tab>", ":bn<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":bp<CR>", { silent = true })
vim.keymap.set("n", "<leader>x", ":bp | sp | bn | bd<CR>", { silent = true })

-- open current buffer in a new tab
vim.keymap.set("n", "<leader>te", ":tabe %<CR>", { silent = true })

-- manipulate the quickfix
vim.keymap.set("n", "]q", ":cnext<CR>", { silent = true })
vim.keymap.set("n", "[q", ":cprev<CR>", { silent = true })
vim.keymap.set("n", "<leader>q", ":ccl<CR>", { silent = true })

-- using the clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p')
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+y$')

-- don't modify the registers
vim.keymap.set("v", "<leader>P", '"_dP')
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')

-- search the selected text
vim.keymap.set("v", "<leader>/", 'y/<C-R>"<CR>', { silent = true })

-- toggle some useful values
vim.keymap.set("n", "<leader>/", ":nohls<CR>", { silent = true })
vim.keymap.set("n", "<leader>s", ":set spell!<CR>", { silent = true })
vim.keymap.set("n", "<leader>w", function()
  vim.o.wrap = not vim.o.wrap
  if vim.o.wrap then
    vim.keymap.set("n", "j", "gj", { silent = true, buffer = 0 })
    vim.keymap.set("n", "k", "gk", { silent = true, buffer = 0 })
    vim.keymap.set("n", "$", "g$", { silent = true, buffer = 0 })
    vim.keymap.set("n", "0", "g0", { silent = true, buffer = 0 })
  else
    vim.keymap.del("n", "j", { buffer = 0 })
    vim.keymap.del("n", "k", { buffer = 0 })
    vim.keymap.del("n", "$", { buffer = 0 })
    vim.keymap.del("n", "0", { buffer = 0 })
  end
end, { silent = true })
