-- ---------- Statusline ---------- --
-- Create some function aliases
local api = vim.api
local fn = vim.fn

-- Check if devicons are installed
local icons_ok, icons = pcall(require, "nvim-web-devicons")

-- Get some accent color according to the current mode
local function get_mode_color()
  local mode = api.nvim_get_mode().mode
  local mode_color = "%#StlAcc#"
  if mode == "i" or mode == "ic" then
    mode_color = "%#StlAccInsert#"
  elseif mode == "v" or mode == "V" or mode == "" then
    mode_color = "%#StlAccVisual#"
  elseif mode == "R" then
    mode_color = "%#StlAccReplace#"
  elseif mode == "c" then
    mode_color = "%#StlAccCmd#"
  end
  return mode_color
end

-- Get information on saved buffer
local function get_modified()
  local modified = "%#StlGreen#"
  if vim.bo.modified then
    modified = "%#StlRed#"
  end
  return string.format(" %s%%* ", modified)
end

-- Get information if buffer is readonly
local function get_readonly()
  if not vim.bo.readonly then
    return ""
  end
  return " %#StlRed#%* "
end

-- Get the current file's size recursively
local function get_filesize(bytes, count)
  if bytes >= 1024.0 and count < 4 then
    return get_filesize(bytes / 1024.0, count + 1)
  end
  local type = { "b", "Kb", "Mb", "Gb" }
  return string.format(" %.1f%s ", bytes, type[count])
end

-- Get current filepath, with shorten directory names
local function get_filepath()
  local filep, filee = fn.expand("%:h"), fn.expand("%:e")
  if filep == "" then
    return "%#StlWhite#%f"
  end
  local icon = ""
  if icons_ok then
    icon = string.format("%s ", icons.get_icon(filep, filee, { default = true }))
  end
  return string.format(" %%#StlPurple#%s/%%#StlBlue#%%t  %%#StlWhite#%s", filep, icon)
end

-- Get filetype
local function get_filetype()
  local ftype = vim.bo.filetype
  if ftype == "" then
    return ""
  end
  return string.format(" %%#StlBlue#%s ", ftype)
end

-- Get file encoding
local function get_fileenconding()
  local fencoding = vim.bo.fileencoding
  if fencoding == "" then
    return ""
  end
  return string.format(" %s ", string.upper(fencoding))
end

-- Get file format
local function get_fileformat()
  local fformat = vim.bo.fileformat
  if fformat == "" then
    return ""
  end
  return string.format(" %s ", string.upper(fformat))
end

-- Get every file property
local function get_fileproperties()
  local ftype = get_filetype()
  local fencoding = get_fileenconding()
  local fformat = get_fileformat()
  return string.format("%s%s%s", fformat, fencoding, ftype)
end

-- Get lsp diagnostic counts
local function get_lspdiagnostics()
  if api.nvim_get_mode().mode ~= "i" then
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
      errors = "%#StlRed#  " .. count["errors"] .. " "
    end
    if count["warnings"] ~= 0 then
      warnings = "%#StlYellow#  " .. count["warnings"] .. " "
    end
    if count["hints"] ~= 0 then
      hints = "%#StlGreen#  " .. count["hints"] .. " "
    end
    if count["info"] ~= 0 then
      info = "%#StlBlue#  " .. count["info"] .. " "
    end

    if count["errors"] > 0 or count["warnings"] > 0 or count["hints"] > 0 or count["info"] > 0 then
      return string.format("  %s%s%s%s%%* ", errors, warnings, hints, info)
    else
      return ""
    end
  end
  return ""
end

-- Get the size of the current file
function GetFileSize()
  local fname = fn.expand("%")
  if io.open(fname, "r") == nil then
    FileSize = ""
  else
    FileSize = get_filesize(fn.getfsize(fname), 1)
  end
end

-- Update current git repository's branch name
function GetGitBranch()
  local is_git_dir = fn.trim(fn.system("git rev-parse --is-inside-work-tree"))
  if is_git_dir == "true" then
    GitBranch = string.format(" %%#StlGreen#󰘬 %s  ", fn.trim(fn.system("git -C " .. fn.getcwd() .. " branch --show-current")))
  else
    GitBranch = ""
  end
end

-- Get the git branch and diagnostics for the first time
GetFileSize()
GetGitBranch()

-- Create the statusline table
Statusline = {}

-- Set statusline appereance when active
Statusline.active = function()
  local mode_color = get_mode_color()
  return table.concat {
    mode_color, "  %* ", get_modified(), get_readonly(), FileSize,
    get_filepath(), "  %*%l:%c  %P", get_lspdiagnostics(), "%=%<",
    get_fileproperties(), GitBranch, mode_color, "  "
  }
end

-- Set statusline appereance when inactive
Statusline.inactive = function()
  return "%f"
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

-- Get the current filesize
au({ "BufWritePost", "BufEnter" }, {
  pattern = "*",
  callback = GetFileSize,
  group = set_statusline
})

-- When opening some windows, avoid changing the statusline
au("FileType", {
  pattern = { "qf", "netrw", "TelescopePrompt", "packer", "lspinfo", "lsp-installer" },
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
