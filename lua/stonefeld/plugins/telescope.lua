return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-tree/nvim-web-devicons" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local action_layout = require("telescope.actions.layout")
    local themes = require("telescope.themes")
    local builtin = require("telescope.builtin")

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "TelescopeResults",
      callback = function(ctx)
        vim.api.nvim_buf_call(ctx.buf, function()
          vim.fn.matchadd("TelescopeParent", "\t(.*)\t")
          vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
        end)
      end,
    })

    local path_display_fmt = function(_, path)
      local tail = require("telescope.utils").path_tail(path)
      if tail == path then
        return tail
      end
      return string.format("%s\t(%s)\t", tail, path)
    end

    local borderchars_squared = {
      prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
      results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
    }

    telescope.setup({
      defaults = {
        sorting_strategy = "ascending",
        layout_config = { prompt_position = "top" },
        results_title = false,
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        mappings = {
          i = {
            -- use telescope as if it was fzf
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<ESC>"] = actions.close,

            -- toggle the preview
            ["<M-p>"] = action_layout.toggle_preview,

            -- scrolling the preview
            ["<M-k>"] = actions.preview_scrolling_up,
            ["<M-j>"] = actions.preview_scrolling_down,

            -- use default vim behavior
            ["<C-u>"] = false,
            ["<C-d>"] = false,
          },
        },
      },
      pickers = {
        find_files = { path_display = path_display_fmt },
        live_grep = {
          layout_strategy = "vertical",
          layout_config = {
            vertical = { width = 0.9, height = 0.9, preview_height = 0.4, preview_cutoff = 0 },
            prompt_position = "bottom",
          },
          path_display = { "smart", shorten = { len = 3 } },
          wrap_results = true,
        },
        buffers = themes.get_dropdown({
          previewer = false,
          path_display = path_display_fmt,
          borderchars = borderchars_squared,
          show_all_buffers = true,
          sort_mru = true,
          ignore_current_buffer = true,
          mappings = {
            i = {
              ["<C-d>"] = actions.delete_buffer,
            },
          },
        }),
        help_tags = themes.get_dropdown({ previewer = false, borderchars = borderchars_squared }),
        spell_suggest = themes.get_cursor({ borderchars = borderchars_squared }),
      },
      extensions = {
        ["ui-select"] = themes.get_dropdown({ borderchars = borderchars_squared }),
      },
    })

    pcall(telescope.load_extension, "fzf")
    pcall(telescope.load_extension, "ui-select")

    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { noremap = true, silent = true, desc = desc })
    end

    map("<C-p>", builtin.find_files, "Find files in CWD")
    map("<leader>fh", builtin.help_tags, "Find help information")
    map("<leader><Space>", builtin.buffers, "Find open buffers")
    map("<leader>fd", builtin.diagnostics, "Find diagnostics")
    map("<leader>fw", builtin.live_grep, "Find text inside files from CWD")
    map("z=", builtin.spell_suggest, "Find spelling suggestions")
  end,
}
