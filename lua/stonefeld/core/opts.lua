-- always use the block as cursor
vim.o.guicursor = "a:block"

-- i want to know where my cursor is
vim.o.number = true
vim.o.cursorline = true

-- use 4 spaces as tab
vim.o.tabstop = 4
-- vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- copy indent from current line when starting a new one
vim.o.autoindent = true

-- don't wrap lines but when true, break lines by words (not characters)
vim.o.wrap = false
vim.o.linebreak = true

-- ignore case when lowercase but not when mixed
vim.o.ignorecase = true
vim.o.smartcase = true

-- don't persist highlight on search, but search while typing
vim.o.hlsearch = false
vim.o.incsearch = true

-- start scrolling before and after the limits of the buffer
vim.o.scrolloff = 3

-- always show sings and set the line limit indicator at 120 characters
vim.o.signcolumn = "yes"
vim.o.colorcolumn = "120"

-- share statusline and since using lualine, don't show current mode
vim.o.laststatus = 3
vim.o.showmode = false

-- make splits like a normal person
vim.o.splitright = true
vim.o.splitbelow = true

-- use 24-bit RGB color in the terminal (your term has to support it)
vim.o.termguicolors = true

-- some completion options and winbar
vim.o.completeopt = "menuone,noselect"
vim.o.winbar = "%=%f %m%="

-- swapfiles are not for me
vim.o.swapfile = false