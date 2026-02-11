return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "vtsls", "pyright", "gopls" },
			})

			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local function enable_server(server_name, config)
				local final_config = vim.tbl_deep_extend("force", {
					capabilities = capabilities
				}, config or {})

				vim.lsp.config(server_name, final_config)
				vim.lsp.enable(server_name)
			end

			enable_server("lua_ls", {
				settings = {
					Lua = { diagnostics = { globals = { "vim" } } }
				}
			})

			enable_server("pyright")
			enable_server("vtsls")
			enable_server("gopls")
		end
	}
}
