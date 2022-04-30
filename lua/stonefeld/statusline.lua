-- ---------- Statusline ---------- --
-- Create some function aliases
local fn = vim.fn
local api = vim.api

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
local function get_mode_color()
  local current_mode = api.nvim_get_mode().mode
  local mode_color = "%#StatusLineAccent#"
  if current_mode == "i" or current_mode == "ic" then
    mode_color = "%#StatusLineAccentInsert#"
  elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
    mode_color = "%#StatusLineAccentVisual#"
  elseif current_mode == "R" then
    mode_color = "%#StatusLineAccentReplace#"
  elseif current_mode == "c" then
    mode_color = "%#StatusLineAccentCmd#"
  end
  return mode_color
end

-- Return the current mode with a human-readable description
local function get_mode()
  local current_mode = api.nvim_get_mode().mode
  return string.format(" %s ", modes[current_mode])
end

-- Get the current file's path
local function get_filepath()
  local fpath = fn.fnamemodify(fn.expand "%", ":~:.:h")
  if fpath == "" or fpath == "." then
    return " "
  end
  return string.format("%%<%s/", fpath)
end

-- Get the current file's name
local function get_filename()
  local fname = fn.expand "%:t"
  if fname == "" then
    return ""
  end
  return fname
end

-- Concatenate filepath and filename
local function get_file()
  return get_filepath() .. get_filename()
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
    -- errors = " %#StatusLineAccentDiagnosticError# " .. count["errors"]
    errors = "  " .. count["errors"]
  end
  if count["warnings"] ~= 0 then
    -- errors = " %#StatusLineAccentDiagnosticWarn# " .. count["warnings"]
    errors = "  " .. count["warnings"]
  end
  if count["hints"] ~= 0 then
    -- errors = " %#StatusLineAccentDiagnosticHint# " .. count["hints"]
    errors = "  " .. count["hints"]
  end
  if count["info"] ~= 0 then
    -- errors = " %#StatusLineAccentDiagnosticInfo# " .. count["info"]
    errors = "  " .. count["info"]
  end

  if count["errors"] > 0 or count["warnings"] > 0 or count["hints"] > 0 or count["info"] > 0 then
    return "[" .. errors .. warnings .. hints .. info .. " ]"
  else
    return ""
  end
end

-- Get the current file's filetype
local function get_filetype()
  local ftype = vim.bo.filetype
  if ftype == "" then
    return ""
  end
  return string.format("[%s]", ftype):lower()
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

Statusline = {}

-- Set the active statusline
Statusline.active = function()
  local width = math.ceil(api.nvim_win_get_width(0) * 50 / 212)
  return table.concat {
    "%-", width, ".(%-10.(", get_mode_color(), get_mode(), "%*%) ",
    GitBranch, " %)",
    "%=", get_file(), " %m%r%=",
    "%", width, ".(", get_lsp(), get_lineinfo(), get_filetype(), "%)",
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
