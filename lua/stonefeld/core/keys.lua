-- set leader key to space
vim.g.mapleader = " "

-- space by default shouldn't do nothing
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- move lines without cutting
vim.keymap.set("v", "J", ":m '>+1<CR>gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv", { silent = true })

-- toggle some useful values
vim.keymap.set("n", "<leader>h", ":set hls!<CR>", { silent = true })
vim.keymap.set("n", "<leader>w", ":set wrap!<CR>", { silent = true })
vim.keymap.set("n", "<leader>r", ":set relativenumber!<CR>", { silent = true })

-- using the clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", '"_+p')
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+y$')

-- don't modify the registers
vim.keymap.set("v", "<leader>p", '"_dP')
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')

-- close buffer without closing window
vim.keymap.set("n", "<leader>x", ":bp | sp | bn | bd<CR>", { silent = true })
