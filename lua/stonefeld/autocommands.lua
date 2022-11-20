-- ---------- Autocommands ---------- --
-- Autogroups table
local augroups = {}
local keys_opts = { noremap = true, silent = true }

-- Create a keymap alias
local key = vim.keymap

-- Clean and format the current buffer
augroups.buf_write_pre = {
	clean_whitespace = {
		event = "BufWritePre",
		pattern = "*",
		command = [[
      let curr_pos=getpos('.')
      exe '%s/\s\+$//e'
      call cursor(curr_pos[1], curr_pos[2])
    ]],
	},

	c_style_format = {
		event = "BufWritePre",
		pattern = { "*.c", "*.cpp" },
		command = [[
      let curr_pos=getpos('.')
      exe '%s/\<if(/if (/e'
      exe '%s/\<for(/for (/e'
      exe '%s/\<while(/while (/e'
      exe '%s/\<switch(/switch (/e'
      exe '%s/}break;/} break;/e'
      call cursor(curr_pos[1], curr_pos[2])
    ]],
	},

	lsp_formatting = {
		event = "BufWritePre",
		pattern = { "*.js", "*.jsx", "*.lua", "*.py", "*.ts", "*.tsx" },
		command = [[ lua vim.lsp.buf.format() ]],
	},
}

-- Set correct filetype for some extensions
augroups.set_filetypes = {
	set_term_ft = {
		event = "TermOpen",
		pattern = "term://*",
		command = [[ setl ft=term ]],
	},

	set_html_ft = {
		event = { "BufNewFile", "BufRead" },
		pattern = "*.html",
		command = [[ setl ft=html ]],
	},

	set_tex_ft = {
		event = { "BufNewFile", "BufRead" },
		pattern = "*.tex",
		command = [[ setl ft=tex ]],
	},
}

-- Change options for filetypes
augroups.filetype_options = {
	two_space_indent = {
		event = "FileType",
		pattern = {
			"arduino",
			"css",
			"html",
			"javascript",
			"javascriptreact",
			"json",
			"jsonc",
			"lua",
			"markdown",
			"rmd",
			"tex",
			"typescript",
			"typescriptreact",
			"vim",
			"xml",
			"xquery",
			"xsd",
			"xslt",
			"yaml",
		},
		callback = function()
			vim.opt_local.tabstop = 2
			vim.opt_local.softtabstop = 2
			vim.opt_local.shiftwidth = 2
			vim.opt_local.expandtab = true
		end,
	},

	markdown_folding = {
		event = "FileType",
		pattern = { "markdown", "rmd" },
		callback = function()
			vim.opt_local.foldenable = true
			vim.opt_local.foldmethod = "marker"
			vim.opt_local.foldmarker = "<!-- {{{ -->,<!-- }}} -->"
		end,
	},

	markdown_cmp = {
		event = "FileType",
		pattern = { "markdown", "rmd" },
		callback = function()
			local status_ok, cmp = pcall(require, "cmp")
			if status_ok then
				cmp.setup.buffer({ enabled = false })
			end
		end,
	},

	markup_options = {
		event = "FileType",
		pattern = { "markdown", "rmd", "tex", "text" },
		callback = function()
			vim.opt_local.wrap = true
			vim.opt_local.linebreak = true
			vim.opt_local.textwidth = 80
			vim.opt_local.number = false
			vim.opt_local.relativenumber = false
			vim.opt_local.signcolumn = "no"
		end,
	},

	c_indent_options = {
		event = "FileType",
		pattern = { "c", "cpp", "arduino" },
		callback = function()
			vim.opt_local.expandtab = false
			vim.opt_local.cindent = true
			vim.opt_local.cinoptions = "(0,W4,w1,m1,l1,t0,g0"
		end,
	},

	qf_window_style = {
		event = "FileType",
		pattern = "qf",
		callback = function()
			vim.opt_local.number = false
			vim.opt_local.relativenumber = false
		end,
	},
}

-- Set specific keymaps for some filetypes
augroups.filetype_keymaps = {
	markup_keys = {
		event = "FileType",
		pattern = { "markdown", "rmd", "tex", "text" },
		callback = function()
			key.set("n", "j", "gj", keys_opts)
			key.set("n", "k", "gk", keys_opts)
			key.set("n", "I", "gI", keys_opts)
			key.set("n", "A", "g$a", keys_opts)
			key.set("n", "0", "g0", keys_opts)
			key.set("n", "$", "g$", keys_opts)
		end,
	},

	compile_markdown_and_tex = {
		event = "FileType",
		pattern = { "markdown", "tex" },
		callback = function()
			key.set("n", "<m-m>", "<cmd>w! | execute '!compiler ' . expand('%:p')<cr>", keys_opts)
			key.set("n", "<m-o>", "<cmd> execute '!xdg-open ' . expand('%:r') . '.pdf &' | redraw!<cr>", keys_opts)
		end,
	},

	compile_rmd = {
		event = "FileType",
		pattern = "rmd",
		callback = function()
			key.set("n", "<m-m>", "<cmd>w! | !echo \"require(rmarkdown); render('%')\" | R --vanilla<cr>", keys_opts)
			key.set("n", "<m-o>", "<cmd>exe '!xdg-open ' . expand('%:r') . '.pdf &' | redraw!<cr>", keys_opts)
		end,
	},

	q_to_close = {
		event = "FileType",
		pattern = "qf",
		callback = function()
			key.set("n", "q", "<cmd>q<cr>", keys_opts)
		end,
	},
}

-- Miscellaneous
augroups.misc = {
	visual_yank = {
		event = "TextYankPost",
		pattern = "*",
		callback = function()
			vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150, on_visual = true })
		end,
	},
}

-- Create autocommands from augroups table
for group, commands in pairs(augroups) do
	local augroup = vim.api.nvim_create_augroup(group, { clear = true })
	for _, opts in pairs(commands) do
		local event = opts.event
		opts.event = nil
		opts.group = augroup
		vim.api.nvim_create_autocmd(event, opts)
	end
end
