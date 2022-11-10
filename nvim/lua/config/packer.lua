local packer_dir = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local treesitter_dir = vim.fn.stdpath("data") .. "/site/pack/packer/start/nvim-treesitter"

if vim.fn.isdirectory(packer_dir) == 0 then
	vim.fn.system({
		"git",
		"clone",
		"--depth=1",
		"https://github.com/wbthomason/packer.nvim",
		packer_dir,
	})

	vim.api.nvim_command("packadd packer.nvim")
end

require("packer").init({
	display = {
		non_interactive = true,
	},
})

require("packer").startup(
	function (use)
		use "wbthomason/packer.nvim"

		use {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/nvim-cmp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		}

		use "numToStr/Comment.nvim"

		use "lewis6991/gitsigns.nvim"

		use "NMAC427/guess-indent.nvim"

		use "phaazon/hop.nvim"

		use {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		}

		use "nvim-lualine/lualine.nvim"

		use {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		}

		use "kyazdani42/nvim-tree.lua"

		use "navarasu/onedark.nvim"

		use "nvim-lua/plenary.nvim"

		use {
			"nvim-telescope/telescope.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		}

		use "cappyzawa/trim.nvim"

		if vim.fn.isdirectory(treesitter_dir) == 1 then
			use {
				"nvim-treesitter/nvim-treesitter",
				run = ":TSUpdate",
			}

			require("config.plugins")

			vim.api.nvim_create_autocmd(
				{ "User" },
				{
					pattern = "PackerComplete",
					callback = function ()
						print("All plugins are up-to-date!")
					end,
				}
			)
		else
			use "nvim-treesitter/nvim-treesitter"

			vim.api.nvim_create_autocmd(
				{ "User" },
				{
					pattern = "PackerComplete",
					callback = function () require("config.plugins") end,
				}
			)
		end

		require("packer").sync()
	end
)
