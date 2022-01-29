-- ---------- Statusline ---------- --
local M = {}

-- List of length limit
M.trunc_width = setmetatable({
    mode = 80,
    git_status = 90,
    filename = 140,
    line_col = 90,
}, {
    __index = function()
        return 90
    end
})

-- Check if region should be truncated
M.is_truncated = function(_, width)
    local current_width = vim.api.nvim_win_get_width(0)
    return current_width < width
end

-- Colors
M.colors = {
    active = "%#ToolbarButton#",
    inactive = "%#StatusLineNC#",
    mode = "%#Debug#",
}

-- Table of available modes
M.modes = setmetatable({
    ["n"] = { "Normal", "N" };
    ["i"] = { "Insert", "I" };
    ["v"] = { "Visual", "V" };
    ["V"] = { "V-line", "VL" };
    ["<C-V>"] = { "V-block", "VB" };
    ["t"] = { "Terminal", "T" };
    ["R"] = { "Replace", "R" };
    ["Rv"] = { "V-replace", "VR" };
    ["c"] = { "Command", "C" };
}, {
    __index = function()
        return { "Unknown", "U" }
    end
})

-- Get the current mode
M.get_current_mode = function(self)
    local current_mode = vim.api.nvim_get_mode().mode
    if self:is_truncated(self.trunc_width.mode) then
        return string.format("5.( %s ", self.modes[current_mode][2])
    end
    return string.format("10.( %s ", self.modes[current_mode][1])
end

-- Get the filename
M.get_filename = function(self)
    local filename = vim.fn.expand("%:~:.")
    if self:is_truncated(self.trunc_width.filename) then
        return "%t"
    end
    return string.format("%s", filename)
end

-- Get the filetype
M.get_filetype = function()
    local filetype = vim.bo.filetype
    if filetype == "" then
        return ""
    end
    return string.format("[%s]", filetype):lower()
end

-- Get line and column number
M.get_line_col = function(self)
    if self:is_truncated(self.trunc_width.line_col) then
        return "[%l:%c]"
    end
    return "[%5l:%5c]"
end

-- Set the active statysline style
M.set_active = function(self)
    local width = vim.api.nvim_win_get_width(0)

    local mode = self:get_current_mode() .. self.colors.active
    local git_branch = GitBranch
    local left_hand_side = table.concat({
        self.colors.mode, "%-", mode, "%)",
        "%-", math.ceil(width * 22 / 210), ".(", git_branch, "%) "
    })

    local filename = "%=" .. self:get_filename() .. " %m%r"

    local filetype = self:get_filetype()
    local line_col = self:get_line_col()
    local right_hand_size = table.concat({
        "%=%", math.ceil(width * 32 / 210), ".(", line_col, " ", filetype, "%)"
    })

    return table.concat({
        left_hand_side,
        filename,
        right_hand_size
    })
end

-- Set the inactive statusline style
M.set_inactive = function(self)
    return self.colors.inactive .. "%=%F%="
end

-- Get the git branch name
function GetGitBranch()
    local is_git_dir = vim.fn.trim(vim.fn.system('git rev-parse --is-inside-work-tree'))
    if is_git_dir == "true" then
        GitBranch = string.format("󰘬 %s", vim.fn.trim(vim.fn.system("git -C " .. vim.fn.getcwd() .. " branch --show-current")))
    else
        GitBranch = ""
    end
end

-- Set the statusline
Statusline = setmetatable(M, {
    __call = function(self, mode)
        return self["set_" .. mode](self)
    end
})

-- Autocmd to set statusline dynamically
vim.cmd [[
    augroup set_statusline
        autocmd!
        autocmd WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline('active')
        autocmd WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline('inactive')
        autocmd BufEnter * lua GetGitBranch()
    augroup end
]]
