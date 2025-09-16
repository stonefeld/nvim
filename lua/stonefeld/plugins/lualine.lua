return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },
  init = function()
    vim.o.showmode = false
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
        return str:sub(1, 3)
      end,
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

    local diagnostics = {
      "diagnostics",
      symbols = {
        -- error = "● ",
        -- warn = "● ",
        -- info = "● ",
        -- hint = "● ",
        error = "E ",
        warn = "W ",
        info = "I ",
        hint = "H ",
      },
    }

    require("lualine").setup({
      options = {
        section_separators = "",
        component_separators = "",
      },
      sections = {
        lualine_a = {},
        lualine_b = { mode },
        lualine_c = { sep, filename },
        lualine_x = { diagnostics, sep, diff, sep, "location" },
        lualine_y = {},
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { filename },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}
