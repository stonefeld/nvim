return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-tree/nvim-web-devicons" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local action_layout = require("telescope.actions.layout")
    local themes = require("telescope.themes")

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
        find_files = {
          path_display = path_display_fmt,
        },
        buffers = {
          theme = "dropdown",
          previewer = false,
          path_display = path_display_fmt,
          show_all_buffers = true,
          sort_mru = true,
          ignore_current_buffer = true,
          mappings = {
            i = {
              ["<C-d>"] = actions.delete_buffer,
            },
          },
        },
        live_grep = {
          previewer = false,
          path_display = {
            shorten = { len = 1 },
          },
        },
        help_tags = {
          theme = "dropdown",
          previewer = false,
        },
        spell_suggest = {
          theme = "cursor",
          previewer = false,
        },
      },
      extensions = {
        ["ui-select"] = { themes.get_dropdown() },
      },
    })

    pcall(telescope.load_extension("fzf"))
    pcall(telescope.load_extension("ui-select"))

    local opts = { silent = true }
    vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>", opts)
    vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
    vim.keymap.set("n", "<leader><Space>", ":Telescope buffers<CR>", opts)
    vim.keymap.set("n", "<leader>fd", ":Telescope diagnostics<CR>", opts)
    vim.keymap.set("n", "<leader>fw", ":Telescope live_grep<CR>", opts)
    vim.keymap.set("n", "z=", ":Telescope spell_suggest<CR>", opts)
  end,
}
