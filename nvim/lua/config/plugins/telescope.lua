require("telescope").setup({
	defaults = {
		layout_config = {
			prompt_position = "top",
		},
		sorting_strategy = "ascending",
		prompt_prefix = " ",
		selection_caret = " ",
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})

require("telescope").load_extension("ui-select")
