-- set leader key to space
vim.g.mapleader = " "

-- space by default shouldn't do nothing
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- move lines without cutting
vim.keymap.set("v", "J", ":m '>+1<CR>gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv", { silent = true })

-- toggle some useful values
vim.keymap.set("n", "<leader>h", ":set hls!<CR>", { silent = true })
vim.keymap.set("n", "<leader>w", function()
  vim.o.wrap = not vim.o.wrap
  if vim.o.wrap then
    vim.keymap.set("n", "j", "gj", { silent = true })
    vim.keymap.set("n", "k", "gk", { silent = true })
    vim.keymap.set("n", "$", "g$", { silent = true })
    vim.keymap.set("n", "0", "g0", { silent = true })
  else
    vim.keymap.del("n", "j")
    vim.keymap.del("n", "k")
    vim.keymap.del("n", "$")
    vim.keymap.del("n", "0")
  end
end, { silent = true })
vim.keymap.set("n", "<leader>s", ":set spell!<CR>", { silent = true })
vim.keymap.set("n", "<leader>t", ":set shiftwidth=")

-- open netrw
vim.keymap.set("n", "<leader>e", ":Ex<CR>", { silent = true })

-- manipulate the quickfix
vim.keymap.set("n", "]q", ":cnext<CR>", { silent = true })
vim.keymap.set("n", "[q", ":cprev<CR>", { silent = true })
vim.keymap.set("n", "<leader>q", ":ccl<CR>", { silent = true })

-- using the clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", '"_+p')
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+y$')

-- don't modify the registers
vim.keymap.set("v", "<leader>p", '"_dP')
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')

-- close buffer without closing window
vim.keymap.set("n", "<Tab>", ":bn<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":bp<CR>", { silent = true })
vim.keymap.set("n", "<leader>x", ":bp | sp | bn | bd<CR>", { silent = true })
