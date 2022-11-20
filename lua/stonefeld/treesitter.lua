-- ---------- Treesitter ---------- --
local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

treesitter.setup({
	ensure_installed = "all",
	sync_install = false,
	ignore_install = { "css", "html", "vim", "latex", "markdown" },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true },
})
