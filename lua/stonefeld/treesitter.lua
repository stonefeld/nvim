-- ---------- Treesitter ---------- --
-- Enable treesitter on startup.
require('nvim-treesitter.configs').setup {
	ignore_install = {
		"css",
		"html",
		"latex",
		"vim"
	},
	highlight = {
		enable = true,
		disable = {
			"css",
			"html",
			"latex",
			"vim"
		},
	}
}
