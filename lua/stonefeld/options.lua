-- ---------- Global Preferences ---------- --
vim.cmd [[ syntax on ]]                                            -- enable syntax highlighting
vim.cmd [[ filetype indent plugin on ]]                            -- enable filetype specific options

local options = {
  spell = false,                                                   -- disable spell checking
  swapfile = false,                                                -- don't create swapfile
  undofile = false,                                                -- don't create undofile
  backup = false,                                                  -- dont't create backupfile
  scrolloff = 3,                                                   -- start scrolling text 3 lines before and after screen limits
  sidescrolloff = 3,                                               -- same as 'scrolloff' but horizontally
  signcolumn = "yes",                                              -- always show left side column for side-messages
  foldcolumn = "auto:9",                                           -- foldcolumn can take from 0 to 9 columns space
  showmode = false,                                                -- disable -- INSERT -- and -- VISUAL -- like messages
  laststatus = 3,                                                  -- show only one big statusline
  tabstop = 4,                                                     -- insert 4 spaces for a tab
  softtabstop = 4,                                                 -- insert 4 spaces for a tab
  shiftwidth = 4,                                                  -- number of spaces inserted for each indentation
  expandtab = true,                                                -- use spaces instead of tabs
  smarttab = true,                                                 -- make tabs smart
  smartindent = true,                                              -- use smart indenting
  autoindent = true,                                               -- copy indent from current line when starting a new line
  wrap = false,                                                    -- display lines as one long line
  splitright = true,                                               -- by default split horizontally to the right
  splitbelow = true,                                               -- by default split vertically at the bottom
  number = true,                                                   -- get line numbers
  relativenumber = true,                                           -- display the line numbers relative to the current position for quick jumps
  cursorline = true,                                               -- don't display a line where the cursor is currently at
  updatetime = 250,                                                -- increase update speed
  mouse = "a",                                                     -- enable mouse interaction
  title = true,                                                    -- allow vim to change window title
  incsearch = true,                                                -- search while typing
  hlsearch = false,                                                -- don't display matches on the previous search pattern
  wildmenu = true,                                                 -- enable wildmenu
  list = true,                                                     -- enable listchars
  listchars = "tab:  ,trail:.",                                    -- display tabs and trailing whitespace
  termguicolors = true,                                            -- enable 24-bit RGB color in the terminal
  background = "dark",                                             -- set background style to dark
  completeopt = { "menuone", "noinsert", "noselect", "preview" },  -- completion options
}

-- Setting the options
for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.shortmess:append("c")                                      -- don't display ins-completion-menu messages
vim.opt.iskeyword:append("-")                                      -- add '-' as a keyword
vim.opt.formatoptions:remove("cro")                                -- don't auto comment new line
