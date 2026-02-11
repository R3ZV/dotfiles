return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			vim.o.background = "dark"

			require("gruvbox").setup({
				palette_overrides = {
					dark0 = "#101010",
					dark1 = "#101010",
				},
			})

			vim.cmd.colorscheme("gruvbox")
			vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg = "black", bg = "#252525" })
		end,
	},

	{
		"stevearc/oil.nvim",
		opts = {},
		lazy = false,
	},

	{
		"echasnovski/mini.icons",
		opts = {},
		lazy = true,
		specs = { { "nvim-tree/nvim-web-devicons", enabled = false, optional = true } },
		init = function()
			package.preload["nvim-web-devicons"] = function()
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
	},
}
