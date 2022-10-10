local cmp = require("cmp")

cmp.setup({
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
	},
	preselect = cmp.PreselectMode.None,
	snippet = {
		expand = function (args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		documentation = cmp.config.window.bordered(),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp", group_index = 1 },
		{ name = "luasnip", group_index = 1 },
		{ name = "buffer", group_index = 2 },
	}),
})
