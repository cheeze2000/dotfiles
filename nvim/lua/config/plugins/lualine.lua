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
		disabled_filetypes = { "NvimTree", "packer" },
	},
	sections = {
		lualine_b = {
			"branch",
			{ "diff", source = diff_source },
		},
		lualine_c = {
			{ "filename", path = 3 },
			{ "diagnostics" },
		},
		lualine_x = { "filetype" },
		lualine_y = {
			{
				function ()
					local servers = {}
					vim.lsp.for_each_buffer_client(0, function (client, _, _)
						table.insert(servers, client.name)
					end)

					return table.concat(servers, " ")
				end,
			}
		},
	},
	inactive_sections = {
		lualine_c = {
			{ "filename", path = 3 },
		},
	},
})
