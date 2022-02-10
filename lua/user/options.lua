-- ---------- Global Preferences ---------- --
-- Dictionary for all options
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
    tabstop = 4,                                                     -- insert 4 spaces for a tab
    softtabstop = 4,                                                 -- insert 4 spaces for a tab
    shiftwidth = 4,                                                  -- number of spaces inserted for each indentation
    expandtab = false,                                               -- use spaces instead of tabs
    smarttab = true,                                                 -- make tabs smart
    autoindent = true,                                               -- copy indent from current line when starting a new line
    cindent = true,                                                  -- automatic C program indenting
    cinoptions = "(0,l1,t0,=0",                                      -- set the C-style indentation rules (see 'cinoptions-values' for more info)
    wrap = false,                                                    -- display lines as one long line
    splitright = true,                                               -- by default split horizontally to the right
    splitbelow = true,                                               -- by default split vertically at the bottom
    number = true,                                                   -- get line numbers
    relativenumber = true,                                           -- display the line numbers relative to the current position for quick jumps
    cursorline = false,                                              -- don't display a line where the cursor is currently at
    updatetime = 250,                                                -- increase update speed
    mouse = "a",                                                     -- enable mouse interaction
    incsearch = true,                                                -- search while typing
    hlsearch = false,                                                -- don't display matches on the previous search pattern
    wildoptions = "tagfile",                                         -- display matching tags in one line
    wildignore = "*.o,*.obj,*.exe,*.bin",                            -- ingore this pattern for the wildmenu
    list = true,                                                     -- enable listchars
    termguicolors = true,                                            -- enable 24-bit RGB color in the terminal
    background = "dark",                                             -- set background style to dark
    completeopt = { "menuone", "noinsert", "noselect", "preview" },  -- completion options
}

-- Settings the options
for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.opt.shortmess:append("c")                                        -- don't display ins-completion-menu messages
vim.opt.iskeyword:append("-")                                        -- add '-' as a keyword

vim.cmd [[syntax on]]                                                -- enable syntax highlighting
vim.cmd [[set listchars=tab:\|\ ,trail:.]]                           -- display tabs as '|' and trailing spaces as '.'
