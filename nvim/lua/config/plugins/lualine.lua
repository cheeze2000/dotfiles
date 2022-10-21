local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

require("lualine").setup({
	options = {
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "NvimTree", "packer" },
	},
	sections = {
		lualine_a = {
			{
				"branch",
				icon = "",
			},
		},
		lualine_b = {
			{
				"filename",
				symbols = { modified = "", readonly = "", unnamed = "" }
			},
		},
		lualine_c = {
			{
				"diff",
				symbols = { added = " ", modified = " ", removed = " " },
				source = diff_source,
			},
		},
		lualine_x = {
			{
				"diagnostics",
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
			},
		},
		lualine_y = {
			{
				function ()
					local servers = {}
					vim.lsp.for_each_buffer_client(0, function (client, _, _)
						table.insert(servers, client.name)
					end)

					return table.concat(servers, " ")
				end,
			},
		},
	},
	inactive_sections = {
		lualine_c = {
			{ "filename", path = 3 },
		},
	},
})
