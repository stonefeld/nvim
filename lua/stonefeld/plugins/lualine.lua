return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },
  init = function()
    vim.o.laststatus = 3
  end,
  config = function()
    local conditions = {
      window_width = function()
        return vim.fn.winwidth(0) > 120
      end,
    }

    local sep = {
      function()
        return " "
      end,
      padding = 0,
    }

    local mode = {
      "mode",
      fmt = function(str)
        if conditions.window_width() then
          return str:sub(1, 1) .. str:sub(2):lower()
        end
        return str:sub(1, 1)
      end,
    }

    local branch = {
      "branch",
      cond = conditions.window_width,
    }

    local diff = {
      "diff",
      cond = conditions.window_width,
    }

    local filename = {
      "filename",
      newfile_status = true,
      path = 1,
    }

    local filetype = {
      "filetype",
      colored = false,
      cond = conditions.window_width,
      padding = { left = 0, right = 1 },
    }

    local encoding = {
      "encoding",
      padding = 0,
    }

    local fileformat = {
      "fileformat",
      symbols = {
        unix = "unix",
        dos = "dos",
        mac = "mac",
      },
      fmt = function(str)
        return "[" .. str .. "]"
      end,
      padding = { left = 0, right = 1 },
    }

    local filesize = {
      "filesize",
      cond = conditions.window_width,
      padding = { left = 0, right = 1 },
    }

    require("lualine").setup({
      options = {
        section_separators = "",
        component_separators = "|",
      },
      -- sections = {
      --   lualine_a = { mode },
      --   lualine_b = { branch, diff, "diagnostics" },
      --   lualine_c = { filename },
      --   lualine_x = {},
      --   lualine_y = { sep, filetype, encoding, fileformat, filesize },
      --   lualine_z = { "location" },
      -- },
      -- inactive_sections = {
      --   lualine_a = {},
      --   lualine_b = {},
      --   lualine_c = { filename },
      --   lualine_x = { "location" },
      --   lualine_y = {},
      --   lualine_z = {},
      -- },
    })
  end,
}
