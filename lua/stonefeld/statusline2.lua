-- ---------- Statusline ---------- --
-- Create some function aliases
local fn = vim.fn
local api = vim.api

local icons_ok, icons = pcall(require, "nvim-web-devicons")

-- Table of available modes
local modes = setmetatable({
  ["n"]  = "Normal",
  ["no"] = "Normal",
  ["v"]  = "Visual",
  ["V"]  = "V-Line",
  [""] = "V-Block",
  ["s"]  = "Select",
  ["S"]  = "S-Line",
  [""] = "S-Block",
  ["i"]  = "Insert",
  ["ic"] = "Insert",
  ["R"]  = "Replace",
  ["Rv"] = "V-Replace",
  ["c"]  = "Command",
  ["cv"] = "Vim Ex",
  ["ce"] = "Ex",
  ["r"]  = "Prompt",
  ["rm"] = "Moar",
  ["r?"] = "Confirm",
  ["!"]  = "Shell",
  ["t"]  = "Terminal",
}, {
  __index = function()
    return "Unknown"
  end
})

-- Display mode with specific color depending on current mode
local function get_mode_color(mode)
  local mode_color = "%#StatusLineAccent#"
  if mode == "i" or mode == "ic" then
    mode_color = "%#StatusLineAccentInsert#"
  elseif mode == "v" or mode == "V" or mode == "" then
    mode_color = "%#StatusLineAccentVisual#"
  elseif mode == "R" then
    mode_color = "%#StatusLineAccentReplace#"
  elseif mode == "c" then
    mode_color = "%#StatusLineAccentCmd#"
  end
  return mode_color
end

-- Return the current mode with a human-readable description
local function get_mode(mode)
  return string.format(" %s ", modes[mode])
end

-- Concatenate filepath and filename
local function get_file(fname, icon)
  return string.format("%s%s", icon, fname)
end

-- Get lsp diagnostic count
local function get_lsp()
  local count = {}
  local levels = {
    errors = "Error",
    warnings = "Warn",
    hints = "Hint",
    info = "Info",
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ""
  local warnings = ""
  local hints = ""
  local info = ""

  if count["errors"] ~= 0 then
    errors = "  " .. count["errors"]
  end
  if count["warnings"] ~= 0 then
    errors = "  " .. count["warnings"]
  end
  if count["hints"] ~= 0 then
    errors = "  " .. count["hints"]
  end
  if count["info"] ~= 0 then
    errors = "  " .. count["info"]
  end

  if count["errors"] > 0 or count["warnings"] > 0 or count["hints"] > 0 or count["info"] > 0 then
    return "[" .. errors .. warnings .. hints .. info .. " ]"
  else
    return ""
  end
end

-- Get the current file's filetype
local function get_filetype(icon)
  local ftype = vim.bo.filetype
  if ftype == "" then
    return ""
  end
  return string.format("[%s%s]", icon, ftype):lower()
end

-- Get the cursor coordinates
local function get_lineinfo()
  if vim.bo.filetype == "alpha" then
    return ""
  end
  return "[%5l:%5c]"
end

-- Update current git repository's branch name
function GetGitBranch()
  local is_git_dir = fn.trim(fn.system("git rev-parse --is-inside-work-tree"))
  if is_git_dir == "true" then
    GitBranch = string.format("󰘬 %s", fn.trim(fn.system("git -C " .. fn.getcwd() .. " branch --show-current")))
  else
    GitBranch = ""
  end
end

-- Get the git branch for the first time
GetGitBranch()

-- Define statusline table
Statusline = {}

-- Set the active statusline
Statusline.active = function()
  local width = math.ceil(api.nvim_win_get_width(0) * 50 / 212)
  local mode = api.nvim_get_mode().mode
  local fname, fext = fn.pathshorten(fn.expand("%:.")), fn.expand("%:e")
  local icon = ""
  if icons_ok and fname ~= "" then
    icon = string.format("%s ", icons.get_icon(fname, fext, { default = true }))
  end

  return table.concat {
    "%-", width, ".(%-10.(", get_mode_color(mode), get_mode(mode), "%*%) ",
    GitBranch, " %)",
    "%=", get_file(fname, icon), " %m%r%=%<",
    "%", width, ".(", get_lsp(), get_lineinfo(), get_filetype(icon), "%)",
  }
end

-- Set the unactive statusline
Statusline.inactive = function()
  return "%=%F%="
end

-- Create some aliases for autogroup and autocommands
local aug = api.nvim_create_augroup
local au = api.nvim_create_autocmd

-- Create the statusline autogroup
local set_statusline = aug("set_statusline", { clear = true })

-- When switching window or entering buffer update statusline
au({ "WinEnter", "BufEnter" }, {
  pattern = "*",
  command = [[ setl stl=%!v:lua.Statusline.active() ]],
  group = set_statusline
})

-- Only set the inactive statusline when laststatus is not set to 3
if vim.opt.laststatus:get() ~= 3 then
  au({ "WinLeave", "BufLeave" }, {
    pattern = "*",
    command = [[ setl stl=%!v:lua.Statusline.inactive() ]],
    group = set_statusline
  })
end

-- Update the git branch name on every buffer read
au("BufEnter", {
  pattern = "*",
  callback = GetGitBranch,
  group = set_statusline
})

-- When opening some windows, avoid changing the statusline
au("FileType", {
  pattern = { "qf", "TelescopePrompt", "packer", "lspinfo", "lsp-installer" },
  callback = function()
    local set_stl = function()
      vim.cmd [[ setl stl=%* ]]
    end
    set_stl()
    au({ "WinEnter", "BufEnter", "WinLeave", "BufLeave" }, {
      buffer = 0,
      callback = set_stl,
    })
  end,
  group = set_statusline
})
