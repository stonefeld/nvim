-- space by default shouldn't do nothing
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- open a file explorer
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- navigating through buffers
vim.keymap.set("n", "<Tab>", vim.cmd.bn)
vim.keymap.set("n", "<S-Tab>", vim.cmd.bp)
vim.keymap.set("n", "<BS>", ":b#<CR>", { silent = true })
vim.keymap.set("n", "<M-w>", ":bp | bd #<CR>", { silent = true })

-- move lines without cutting
vim.keymap.set("v", "J", ":m '>+1<CR>gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv", { silent = true })

-- toggle some useful values
vim.keymap.set("n", "/", ":set hls<CR>/")
vim.keymap.set("n", "<leader>h", ":set hls!<CR>", { silent = true })
vim.keymap.set("n", "<leader>w", ":set wrap!<CR>", { silent = true })

-- using the clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", '"_+p')
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+y$')

-- don't modify the registers
vim.keymap.set({ "n", "v" }, "<leader>P", '"_dP')
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')
