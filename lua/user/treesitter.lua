-- ---------- Treesitter ---------- --
local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

treesitter.setup {
    ensure_installed = "maintained",
    sync_install = false,
    ignore_install = { "css", "html", "vim" },
    highlight = {
        enable = true,
        disable = { "" },
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = false },
}
