return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  config = function()
    local comment = require("Comment")
    local ft = require("Comment.ft")
    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    comment.setup({
      pre_hook = ts_context_commentstring.create_pre_hook(),
    })

    ft.set("htmldjango", { "{#%s#}", "{% comment %}%s{% endcomment %}" })
  end,
}
