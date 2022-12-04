-- ---------- Cmp ---------- --
local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
	return
end

-- using some nice icons for autocompletion window
local kind_icons = {
	Text = " ",
	Method = "m ",
	Function = " ",
	Constructor = " ",
	Field = " ",
	Variable = " ",
	Class = " ",
	Interface = " ",
	Module = " ",
	Property = " ",
	Unit = " ",
	Value = " ",
	Enum = " ",
	Keyword = " ",
	Snippet = " ",
	Color = " ",
	File = " ",
	Reference = " ",
	Folder = " ",
	EnumMember = " ",
	Constant = " ",
	Struct = " ",
	Event = " ",
	Operator = " ",
	TypeParameter = " ",
}

local select = { behavior = cmp.SelectBehavior.Select }

-- basic nvim-cmp configuration
cmp.setup({
	preselect = false,
	snippet = {
		expand = function(args)
			local ls_ok, ls = pcall(require, "luasnip")
			if ls_ok then
				ls.lsp_expand(args.body)
			end
		end,
	},
	mapping = {
		["<c-n>"] = cmp.mapping.select_next_item(select),
		["<c-p>"] = cmp.mapping.select_prev_item(select),
		["<c-y>"] = cmp.mapping.confirm({ select = true }),
		["<c-space>"] = cmp.mapping.complete(),
		["<c-e>"] = cmp.mapping.abort(),
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind]) -- enable icons
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				luasnip = "[Snip]",
				buffer = "[Buffer]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	},
})
