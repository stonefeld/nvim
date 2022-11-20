-- ---------- Catppuccin ---------- --
local status_ok, cp = pcall(require, "catppuccin")
if not status_ok then
	return
end

local col = require("catppuccin.palettes").get_palette()
cp.setup({
	flavour = "mocha",
	integrations = {
		dap = {
			enabled = true,
			enable_ui = true,
		},
	},
	compile = {
		enabled = true,
		path = vim.fn.stdpath("cache") .. "/catppuccin",
	},
	custom_highlights = {
		StlAcc = { fg = "NONE", bg = col.blue },
		StlAccInsert = { fg = "NONE", bg = col.green },
		StlAccVisual = { fg = "NONE", bg = col.mauve },
		StlAccReplace = { fg = "NONE", bg = col.red },
		StlAccCmd = { fg = "NONE", bg = col.yellow },
		StlAccExtra = { fg = "NONE", bg = col.sky },
		StlWhite = { fg = col.white, bg = col.mantle, style = { "bold" } },
		StlRed = { fg = col.red, bg = col.mantle, style = { "bold" } },
		StlYellow = { fg = col.yellow, bg = col.mantle, style = { "bold" } },
		StlGreen = { fg = col.green, bg = col.mantle, style = { "bold" } },
		StlBlue = { fg = col.blue, bg = col.mantle, style = { "bold" } },
		StlPurple = { fg = col.mauve, bg = col.mantle, style = { "bold" } },
	},
})
