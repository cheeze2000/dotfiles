local rt = require("rust-tools")

rt.setup({
	tools = {
		hover_actions = {
			auto_focus = true,
		},
	},
	server = {
		on_attach = function (_, n)
			vim.keymap.set("n", "<Leader>la", rt.hover_actions.hover_actions, { buffer = n })
		end,
	},
})
