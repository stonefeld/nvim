-- source the keymapping function
local u = require("stonefeld.core.utils")

-- mapleader is and always will be space
vim.g.mapleader = " "

-- space shouldn't do anything
u.map({ "n", "v" }, "<Space>", "<Nop>")

-- move lines easily
u.map("v", "J", ":m '>+1<CR>gv", "[Core] Move selected lines down")
u.map("v", "K", ":m '<-2<CR>gv", "[Core] Move selected lines up")

-- open netrw
u.nmap("<leader>e", ":Ex $PWD<CR>", "[Core] Open netrw (file explorer)")
u.nmap("<leader>fe", ":Ex<CR>", "[Core] Open netrw (file explorer)")

-- manage buffers
u.nmap("<Tab>", ":bn<CR>", "[Core] Focus next buffer")
u.nmap("<S-Tab>", ":bp<CR>", "[Core] Focus previous buffer")
u.nmap("<leader>x", ":b# | sp | b# | bd<CR>", "[Core] Close current buffer")
u.nmap("<leader>o", ":b#<CR>", "[Core] Switch to the alternate buffer")

-- manage tabs
u.nmap("<leader>tc", ":tabclose<CR>", "[Core] Close current tab")
u.nmap("<leader>to", ":tabonly<CR>", "[Core] Leave only one tab open")

-- navigating through diagnostics
u.nmap("gl", function()
  vim.diagnostic.open_float({
    max_width = 100,
    max_height = 14,
    border = "rounded",
  })
end, "[Core] Open diagnostics message")
u.nmap("<leader>fd", vim.diagnostic.setqflist, "[Core] Open quickfix list with diagnostics")

-- moving through the quickfix
u.nmap("]q", ":cnext<CR>", "[Core] Focus next quickfix item")
u.nmap("[q", ":cprev<CR>", "[Core] Focus previous quickfix item")
u.nmap("<leader>q", ":ccl<CR>", "[Core] Close quickfix list")

-- using the clipboard
u.map({ "n", "v" }, "<leader>p", '"+p', "[Core] Paste from clipboard")
u.map({ "n", "v" }, "<leader>y", '"+y', "[Core] Yank to clipboard")
u.nmap("<leader>Y", '"+y$', "[Core] Yank to clipboard until the end of line")

-- don't modify the registers
u.map("v", "<leader>P", '"_dP', "[Core] Paste without modifying the registers")
u.map({ "n", "v" }, "<leader>d", '"_d', "[Core] Delete without modifying the registers")

-- search the selected text
u.map("v", "<leader>/", 'y/<C-R>"<CR>', "[Core] Search the selected text")

-- toggle some items
u.nmap("<leader>th", ":set hls!<CR>", "[Core] Toggle search highlighting")
u.nmap("<leader>ts", ":set spell!<CR>", "[Core] Toggle spell checking")
u.nmap("<leader>tl", ":set list!<CR>", "[Core] Toggle listchars")
u.nmap("<leader>tw", ":set wrap!<CR>", "[Core] Toggle line wrapping")
u.nmap("<leader>tr", ":set relativenumber!<CR>", "[Core] Toggle relative line numbers")

-- print full path of the current file
u.nmap("<leader><C-g>", ":echo expand('%:p')<CR>", "[Core] Print full path of the current file")
