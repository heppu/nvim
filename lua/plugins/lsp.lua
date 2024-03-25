return {
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "neovim/nvim-lspconfig" },
	{
		"williamboman/mason.nvim",
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			require("mason").setup({})

			require("mason-tool-installer").setup({
				ensure_installed = {
					"stylua",
					"eslint_d",
					"prettierd",
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"bashls",
					"lua_ls",
					"rust_analyzer",
					"gopls",
					"templ",
					"html",
					"htmx",
					"jsonls",
					"tsserver",
				},
				handlers = {
					require("lsp-zero").default_setup,
				},
			})
		end,
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		config = function()
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_lspconfig()
			lsp_zero.on_attach(function(client, bufnr)
				lsp_zero.default_keymaps({ buffer = bufnr })
			end)
		end,
	},
	{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
}
