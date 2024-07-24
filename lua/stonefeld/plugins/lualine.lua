return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")

    local function big_window()
      return vim.api.nvim_win_get_width(0) > 120
    end

    local diff = {
      "diff",
      cond = big_window,
    }

    local diagnostics = {
      "diagnostics",
      symbols = { error = " ", warn = " ", hint = " ", info = " " },
    }

    local filename = function()
      local filepath
      if big_window() then
        filepath = vim.fn.pathshorten(vim.fn.expand("%:p:~"))
      else
        filepath = vim.fn.expand("%:t")
      end
      return filepath
    end

    local filetype = {
      "filetype",
      colored = false,
      padding = {
        left = 1,
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
        lualine_a = { filename },
        lualine_b = { "branch", diff },
        lualine_c = { diagnostics },
        lualine_x = { "%h%m%r" },
        lualine_y = { filetype, encoding, fileformat, filesize },
      },
      inactive_sections = {
        lualine_c = { filename },
      },
    })
  end,
}
