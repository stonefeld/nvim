-- always use the block as cursor
vim.o.guicursor = "a:block"

-- right-click mouse no paste
vim.o.mousemodel = "extend"

-- i want to know where my cursor is
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true

-- use 4 spaces as tab
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

-- don't show the current mode
vim.o.showmode = false

-- ignore case when lowercase but not when mixed
vim.o.ignorecase = true
vim.o.smartcase = true

-- don't persist highlight on search, but search while typing
vim.o.incsearch = true

-- start scrolling before and after the limits of the buffer
vim.o.scrolloff = 3

-- always show sings and set the line limit indicator at 120 characters
vim.o.signcolumn = "yes"
vim.o.colorcolumn = "120"
vim.o.foldcolumn = "auto:1"

-- decrease update time
vim.o.updatetime = 250

-- make splits like a normal person
vim.o.splitright = true
vim.o.splitbelow = true

-- use 24-bit RGB color in the terminal (your term has to support it)
vim.o.termguicolors = true

-- some completion options
vim.o.completeopt = "menuone,noselect"

-- swapfiles are not for me
vim.o.swapfile = false

-- show a preview of the substitution
vim.o.inccommand = "split"

-- set spell languages to spanish and english
vim.o.spelllang = "es,en_us"

-- set listchars to display tabs, end of lines and spaces
vim.o.listchars = "tab:| ,eol:$,space:."

-- enable editorconfig by default
vim.g.editorconfig = true
