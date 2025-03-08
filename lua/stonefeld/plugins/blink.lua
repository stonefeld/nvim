return {
  "saghen/blink.cmp",
  dependencies = "rafamadriz/friendly-snippets",
  version = "v0.*",
  opts = {
    signature = { enabled = true },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "normal",
    },
    cmdline = {
      enabled = false,
    }
  },
  opts_extend = { "sources.default" },
}
