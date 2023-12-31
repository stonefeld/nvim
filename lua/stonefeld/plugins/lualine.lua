return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local theme = require("lualine.themes.auto")
    local lazy_status = require("lazy.status")

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
      end,

      hide_in_width = function()
        return vim.api.nvim_get_option("columns") > 100
      end,
    }

    local spacer = {
      function()
        return " "
      end,
      cond = conditions.hide_in_width,
    }

    local mode = {
      function()
        return "  "
      end,
      padding = { left = 0, right = 0 },
    }

    local filesize = {
      "filesize",
      cond = conditions.buffer_not_empty,
    }

    local filetype = {
      "filetype",
      colored = false,
      icon_only = true,
      cond = conditions.buffer_not_empty,
      color = { fg = theme.visual.b.fg },
      padding = { left = 1, right = 0 },
    }

    local filename = {
      "filename",
      newfile_status = true,
      cond = conditions.buffer_not_empty,
      color = { fg = theme.visual.b.fg, gui = "bold" },
    }

    local location = {
      "location",
      color = { gui = "bold" },
    }

    local progress = {
      "progress",
      color = { gui = "bold" },
    }

    local packages = {
      lazy_status.updates,
      cond = lazy_status.has_updates,
      color = { fg = theme.replace.b.fg, gui = "bold" },
    }

    local diagnostics = {
      "diagnostics",
      symbols = { error = " ", warn = " ", hint = " ", info = " " },
    }

    local lsp = {
      function()
        local msg = "No Active LSP"
        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
        local clients = vim.lsp.get_active_clients()

        if next(clients) == nil then
          return msg
        end

        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
          end
        end

        return msg
      end,
      icon = "  LSP:",
      color = { fg = theme.normal.b.fg, gui = "bold" },
      cond = conditions.hide_in_width,
    }

    local encoding = {
      "encoding",
      fmt = string.upper,
      color = { fg = theme.insert.b.fg, gui = "bold" },
    }

    local fileformat = {
      "fileformat",
      fmt = string.upper,
      icons_enabled = false,
      color = { fg = theme.insert.b.fg, gui = "bold" },
    }

    local branch = {
      "branch",
      icon = "",
      color = { fg = theme.command.b.fg, gui = "bold" },
    }

    local diff = {
      "diff",
      cond = conditions.hide_in_width,
    }

    lualine.setup({
      options = {
        icons_enabled = true,
        component_separators = "",
        section_separators = "",
        disabled_filetypes = {
          "TelescopePrompt",
        },
      },
      sections = {
        lualine_a = { mode },
        lualine_b = {},
        lualine_c = { spacer, filesize, filetype, filename, location, progress, packages, diagnostics },
        lualine_x = { lsp, encoding, fileformat, branch, diff, spacer },
        lualine_y = {},
        lualine_z = { mode },
      },
    })
  end,
}
