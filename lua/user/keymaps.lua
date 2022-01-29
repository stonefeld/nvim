-- ---------- Keymaps ---------- --
-- Default options for keybindings
local opts = { noremap = true, silent = true }

-- Set the leader key to space
vim.g.mapleader = " "

-- ----- Normal ----- --
-- Open file explorer
vim.keymap.set("n", "<leader>e", "<cmd>Lexplore<cr>", opts)

-- Resize panes
vim.keymap.set("n", "<c-Left>", "<cmd>vertical resize +5<cr>", opts)
vim.keymap.set("n", "<c-Right>", "<cmd>vertical resize -5<cr>", opts)
vim.keymap.set("n", "<c-Up>", "<cmd>resize +1<cr>", opts)
vim.keymap.set("n", "<c-Down>", "<cmd>resize -1<cr>", opts)

-- Navigating buffers
vim.keymap.set("n", "<c-l>", "<cmd>bn<cr>", opts)
vim.keymap.set("n", "<c-h>", "<cmd>bp<cr>", opts)
vim.keymap.set("n", "<c-k>", "<cmd>bp<cr><cmd>bd #<cr>", opts)

-- Keep the cursor centered on the screen
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- ----- Insert ----- --
-- Undo break points
vim.keymap.set("i", "<space>", "<space><c-g>u", opts)
vim.keymap.set("i", ",", ",<c-g>u", opts)
vim.keymap.set("i", ".", ".<c-g>u", opts)
vim.keymap.set("i", "!", "!<c-g>u", opts)
vim.keymap.set("i", "?", "?<c-g>u", opts)

-- ----- Visual ----- --
-- Move lines up and down while selected
vim.keymap.set("v", "J", ":m '>+1<cr>gv", opts)
vim.keymap.set("v", "K", ":m '<-2<cr>gv", opts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Run figlet on the selected content
vim.keymap.set("v", "<leader>ff", ":!figlet<cr>", opts)

-- Telescope
vim.keymap.set("n", "<c-p>", "<cmd>Telescope find_files<cr>", opts)
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
vim.keymap.set("n", "<leader>fa", "<cmd>Telescope buffers<cr>", opts)
vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", opts)
