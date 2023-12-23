return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local theme = require("lualine.themes.auto")
    local lazy_status = require("lazy.status")

    local diagnostics = {
      "diagnostics",
      symbols = { error = " ", warn = " ", hint = " ", info = " " },
      fmt = function(str)
        return " " .. str
      end,
    }

    local mode = {
      "mode",
      fmt = function(str)
        return "-- " .. str .. " --"
      end,
    }

    local packages = {
      lazy_status.updates,
      cond = lazy_status.has_updates,
      color = { fg = theme.command.b.fg },
    }

    local spaces = function()
      local size = vim.api.nvim_buf_get_option(0, "shiftwidth")
      if vim.api.nvim_buf_get_option(0, "expandtab") then
        return "spaces: " .. size
      end
      return "tabs: " .. size
    end

    lualine.setup({
      options = {
        icons_enabled = true,
        component_separators = "",
        section_separators = {
          left = "",
          right = "",
        },
        disabled_filetypes = {
          "TelescopePrompt",
        },
      },
      sections = {
        lualine_a = { "branch" },
        lualine_b = { mode },
        lualine_c = { "diff", diagnostics },
        lualine_x = { packages, spaces, "encoding", "fileformat", "filetype" },
      },
    })
  end,
}
