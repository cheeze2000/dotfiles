require("nvim-tree").setup({
	hijack_cursor = true,
	open_on_setup = true,
	open_on_setup_file = true,
	view = {
		mappings = {
			list = {
				{ key = "<Tab>", action = "edit" },
				{ key = "h", action = "dir_up" },
				{ key = "l", action = "cd" },
			},
		},
	},
	renderer = {
		highlight_git = true,
		root_folder_modifier = ":t",
		indent_markers = {
			enable = true,
			icons = {
				corner = "│ ",
				edge = "│ ",
				item = "│ ",
				bottom = "│ ",
				none = "│ ",
			},
		},
		icons = {
			symlink_arrow = "  ",
			show = {
				file = false,
				folder = true,
				folder_arrow = false,
				git = false,
			},
			glyphs = {
				default = "",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
			},
		},
		special_files = {},
	},
	filters = {
		custom = { "^.git$" },
	},
	actions = {
		change_dir = {
			global = true,
		},
	},
})
