-- ---------- Treesitter ---------- --
local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

treesitter.setup({
	ensure_installed = {
		"c",
		"cpp",
		"java",
		"javascript",
		"lua",
		"python",
		"rust",
		"typescript",
	},
	sync_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = false },
})
