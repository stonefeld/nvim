return {
  "saghen/blink.cmp",
  dependencies = "rafamadriz/friendly-snippets",
  version = "v0.*",
  opts = {
    appearance = { nerd_font_variant = "normal" },
    cmdline = { enabled = false },
    keymap = {
      preset = "default",
      ["<C-space>"] = {},
      ["<C-o>"] = { "show", "show_documentation", "hide_documentation", "fallback" },
    },
  },
  opts_extend = { "sources.default" },
}
