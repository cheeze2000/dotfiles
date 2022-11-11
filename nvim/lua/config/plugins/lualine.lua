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
		disabled_filetypes = {
			"NvimTree",
			"dapui_scopes",
			"packer",
		},
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
				symbols = { modified = "", readonly = "", unnamed = "" },
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
					local instances = {}

					local dap_session = require("dap").session()
					if dap_session ~= nil then
						table.insert(instances, dap_session.adapter.name)
					end

					vim.lsp.for_each_buffer_client(0, function (client)
						table.insert(instances, client.name)
					end)

					return table.concat(instances, " ")
				end,
			},
		},
	},
	inactive_sections = {
		lualine_c = {
			{
				"filename",
				path = 3,
				symbols = { modified = "", readonly = "", unnamed = "" },
			},
		},
	},
})
