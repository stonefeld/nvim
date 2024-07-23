-- always show a block as cursor
vim.o.guicursor = "a:block"

-- disable right-click menu
vim.o.mousemodel = "extend"

-- cursor position
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true

-- use 4 spaces as tab by default
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- copy indent from current line when starting a new one
vim.o.autoindent = true

-- don't wrap lines but when true, break lines by words (not characters)
vim.o.wrap = false
vim.o.linebreak = true
vim.o.breakindent = true

-- don't show current mode
vim.o.showmode = false

-- case insensitive unless specified
vim.o.ignorecase = true
vim.o.smartcase = true

-- search while typing
vim.o.incsearch = true
vim.o.hlsearch = false

-- start scrolling before reaching borders of window
vim.o.scrolloff = 3

-- always show signs and folds if present
vim.o.signcolumn = "yes"
vim.o.foldcolumn = "auto:1"

-- 120 characters width limit is ok
vim.o.colorcolumn = "121"

-- increase update speed
vim.o.updatetime = 250

-- make splits like a normal person
vim.o.splitright = true
vim.o.splitbelow = true

-- full color support
vim.o.termguicolors = true

-- completion options
vim.o.completeopt = "menuone,noselect"

-- swapfiles are kind of useless
vim.o.swapfile = false

-- spell checking languages
vim.o.spelllang = "es,en_us"

-- set listchars to display tabs, end of lines and spaces
vim.o.listchars = "tab:| ,eol:$,space:."

-- enable editorconfig settings
vim.g.editorconfig = true
