return {
	{ "tpope/vim-sleuth" },
	{ "sindrets/diffview.nvim" },
	{
		"folke/ts-comments.nvim",
		opts = {},
		event = "VeryLazy",
		enabled = true,
	},
	{
		"folke/todo-comments.nvim",
		optional = true,
		keys = {
			{
				"<leader>st",
				function()
					Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
				end,
				desc = "Todo/Fix/Fixme",
			},
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			format_on_save = { timeout_ms = 500, lsp_fallback = true },
		},
	},
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "echasnovski/mini.pairs",          event = "InsertEnter", opts = {} },
}
