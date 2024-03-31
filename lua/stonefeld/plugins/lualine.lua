return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
  },
  config = function()
    local lualine = require("lualine")

    local function big_window()
      return vim.api.nvim_win_get_width(0) > 100
    end

    local spacer = {
      function()
        return " "
      end,
      padding = 0,
    }

    local mode = {
      "mode",
      fmt = function(str)
        if big_window() then
          return str:sub(1, 1) .. str:sub(2):lower()
        end
        return str:sub(1, 1)
      end,
    }

    local diff = {
      "diff",
      colored = false,
      cond = big_window,
    }

    local diagnostics = {
      "diagnostics",
      symbols = { error = " ", warn = " ", hint = " ", info = " " },
      colored = false,
    }

    local filename = {
      "filename",
      newfile_status = true,
      path = 1,
    }

    local filetype = {
      "filetype",
      colored = false,
      padding = {
        left = 0,
        right = 2,
      },
      cond = big_window,
    }

    local encoding = {
      "encoding",
      padding = 0,
      cond = big_window,
    }

    local fileformat = {
      "fileformat",
      symbols = {
        unix = "[unix]",
        dos = "[dos]",
        mac = "[mac]",
      },
      padding = {
        left = 0,
        right = 1,
      },
      cond = big_window,
    }

    local filesize = {
      "filesize",
      cond = big_window,
    }

    lualine.setup({
      options = {
        component_separators = "",
        section_separators = "",
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { "branch", diff, diagnostics },
        lualine_c = { filename },
        lualine_x = {},
        lualine_y = { spacer, filetype, encoding, fileformat, filesize },
      },
      inactive_sections = {
        lualine_c = { filename },
      },
    })
  end,
}
