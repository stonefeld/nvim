-- ---------- Treesitter ---------- --
-- Enable treesitter on startup.
require('nvim-treesitter.configs').setup {
    ignore_installed = {
        "latex",
        "css"
    },
    highlight = {
        enable = true
    }
}
