-- ---------- Cmp ---------- --
-- Setup nvim-cmp.
local cmp = require('cmp')

cmp.setup({
	mapping = {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-o>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		['<C-y>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true
		}),
		['<Tab>'] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		['<S-Tab>'] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,
		['<CR>'] = cmp.mapping.confirm({
			select = true,
		}),
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'path' },
	})
})
