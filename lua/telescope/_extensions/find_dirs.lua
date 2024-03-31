local telescope = require("telescope")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values

local global_opts = {}

return telescope.register_extension({
  setup = function(ext_config, _)
    global_opts = vim.tbl_deep_extend("force", global_opts, ext_config or {})
  end,
  exports = {
    find_dirs = function(opts)
      opts = vim.tbl_deep_extend("force", global_opts, opts or {})
      pickers
        .new(opts, {
          prompt_title = "Find Directories",
          finder = finders.new_oneshot_job({ "fd", "--type", "d" }, opts),
          previewer = conf.file_previewer(opts),
          sorter = conf.file_sorter(opts),
        })
        :find()
    end,
  },
})
