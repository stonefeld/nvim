-- ---------- Treesitter ---------- --
-- Enable treesitter on startup.
require('nvim-treesitter.configs').setup {
    ignore_install = {
        "latex",
        "css"
    },
    highlight = {
        enable = true
    }
}
