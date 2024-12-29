return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local action_layout = require("telescope.actions.layout")
    local themes = require("telescope.themes")
    local builtin = require("telescope.builtin")

    local u = require("stonefeld.core.utils")

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
      local tail = vim.fs.basename(path)
      local head = vim.fs.dirname(path)
      if tail == path then
        return tail
      end
      return string.format("%s\t(%s)\t", tail, head)
    end

    telescope.setup({
      defaults = {
        sorting_strategy = "ascending",
        layout_config = { prompt_position = "top" },
        results_title = false,
        mappings = {
          i = {
            -- use telescope as if it was fzf
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            -- ["<ESC>"] = actions.close,

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
          previewer = false,
          path_display = { "smart", shorten = { len = 3 } },
          wrap_results = true,
        },
        buffers = themes.get_dropdown({
          previewer = false,
          path_display = path_display_fmt,
          show_all_buffers = true,
          sort_mru = true,
          ignore_current_buffer = true,
          mappings = {
            i = { ["<C-d>"] = actions.delete_buffer },
            n = { ["<C-d>"] = actions.delete_buffer },
          },
        }),
        help_tags = themes.get_dropdown({ previewer = false }),
        spell_suggest = themes.get_cursor(),
      },
      extensions = {
        ["ui-select"] = themes.get_dropdown({ previewer = false }),
        ["find_dirs"] = themes.get_dropdown({ previewer = false }),
      },
    })

    pcall(telescope.load_extension, "fzf")
    pcall(telescope.load_extension, "ui-select")
    pcall(telescope.load_extension, "find_dirs")

    u.nmap("<C-p>", builtin.find_files, "[Telescope] Find files")
    u.nmap("<leader>ff", "<cmd>Telescope find_dirs<CR>", "[Telescope] Find directories")
    u.nmap("<leader><Space>", builtin.buffers, "[Telescope] Find open buffers")
    u.nmap("<leader>fw", builtin.live_grep, "[Telescope] Find text inside files")
    u.nmap("<leader>fk", builtin.keymaps, "[Telescope] Find keymaps")
    u.nmap("<leader>fh", builtin.help_tags, "[Telescope] Find help information")
    u.nmap("<leader>fs", builtin.spell_suggest, "[Telescope] Find spelling suggestions")
  end,
}
