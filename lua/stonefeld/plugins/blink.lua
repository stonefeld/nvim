return {
  "saghen/blink.cmp",
  dependencies = "rafamadriz/friendly-snippets",
  version = "v0.*",
  opts = {
    keymap = {
      preset = "default",
      cmdline = { preset = "super-tab" },
    },
    signature = { enabled = true },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "normal",
    },
  },
  opts_extend = { "sources.default" },
}
