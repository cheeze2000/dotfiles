local cmp = require("cmp")

local opts = {
	border = "rounded",
	winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
}

cmp.setup({
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-d>"] = cmp.mapping.scroll_docs(9),
		["<C-u>"] = cmp.mapping.scroll_docs(-9),
	},
	preselect = cmp.PreselectMode.None,
	snippet = {
		expand = function (args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = opts,
		documentation = opts,
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp", group_index = 1 },
		{ name = "luasnip", group_index = 1 },
		{ name = "buffer", group_index = 2 },
	}),
})
