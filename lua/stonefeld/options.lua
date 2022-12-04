-- ---------- Global Preferences ---------- --
local options = {
	spell = false, -- disable spell checking
	swapfile = false, -- don't create swapfile
	scrolloff = 3, -- start scrolling text 3 lines before and after screen limits
	sidescrolloff = 3, -- same as 'scrolloff' but horizontally
	signcolumn = "yes", -- always show left side column for side-messages
	foldcolumn = "auto:9", -- foldcolumn can take from 0 to 9 columns space
	showmode = false, -- disable -- INSERT -- and -- VISUAL -- like messages
	winbar = "%=%f", -- show on top of every buffer the name of that file
	laststatus = 3, -- show only one big statusline
	tabstop = 4, -- insert 4 spaces for a tab
	softtabstop = 4, -- insert 4 spaces for a tab
	shiftwidth = 4, -- number of spaces inserted for each indentation
	expandtab = true, -- use spaces instead of tabs
	smartindent = true, -- use smart indenting
	wrap = false, -- display lines as one long line
	splitright = true, -- by default split horizontally to the right
	splitbelow = true, -- by default split vertically at the bottom
	number = true, -- get line numbers
	relativenumber = true, -- display the line numbers relative to the current position for quick jumps
	cursorline = true, -- don't display a line where the cursor is currently at
	hlsearch = false, -- don't display matches on the previous search pattern
	list = true, -- enable listchars
	listchars = "tab:¦ ,trail:.", -- display tabs and trailing whitespace
}

-- Setting the options
for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.opt.shortmess:append("c") -- don't display ins-completion-menu messages
vim.opt.iskeyword:append("-") -- add '-' as a keyword
