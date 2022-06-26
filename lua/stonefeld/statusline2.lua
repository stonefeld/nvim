local api = vim.api
local fn = vim.fn

local icons_ok, icons = pcall(require, "nvim-web-devicons")

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
    errors = "%#DiffDelete#  " .. count["errors"] .. " "
  end
  if count["warnings"] ~= 0 then
    warnings = "%#DiffText#  " .. count["warnings"] .. " "
  end
  if count["hints"] ~= 0 then
    hints = "%#DiffAdd#  " .. count["hints"] .. " "
  end
  if count["info"] ~= 0 then
    info = "%#DiffChange#  " .. count["info"] .. " "
  end

  if count["errors"] > 0 or count["warnings"] > 0 or count["hints"] > 0 or count["info"] > 0 then
    return errors .. warnings .. hints .. info .. "%*"
  else
    return ""
  end
end

local function get_filepath()
  local filep, filee = fn.expand("%:p:~"), fn.expand("%:e")
  if filep == "" then
    return "[No Name]"
  end
  local icon = ""
  if icons_ok then
    icon = string.format("%s ", icons.get_icon(filep, filee, { default = true }))
  end
  return string.format(" %s %s", fn.pathshorten(filep), icon)
end

Statusline = {}

Statusline.active = function()
  local mode = api.nvim_get_mode().mode;
  return table.concat {
    get_mode_color(mode), get_filepath(), "%m%r%*%=",
    get_lsp()
  }
end

Statusline.inactive = function()
  return table.concat {
    "%*", get_filepath()
  }
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
