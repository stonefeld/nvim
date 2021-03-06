-- ---------- Telescope ---------- --
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<c-n>"] = actions.cycle_history_next,
        ["<c-p>"] = actions.cycle_history_prev,
        ["<c-j>"] = actions.move_selection_next,
        ["<c-k>"] = actions.move_selection_previous,
        ["<esc>"] = actions.close,
      },
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      previewer = false,
    },
    live_grep = { theme = "ivy" },
    buffers = {
      theme = "dropdown",
      previewer = false,
      mappings = {
        i = {
          ["<c-d>"] = actions.delete_buffer,
        },
      },
    },
    lsp_dynamic_workspace_symbols = { theme = "ivy" },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
}

pcall(telescope.load_extension, "fzf")
