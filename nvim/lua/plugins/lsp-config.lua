return {
	{
		"williamboman/mason.nvim",
		opts = {
			pip = {
				upgrade_pip = true,
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls", "ruff", "pyright", "gopls" },
		},
	},
	{
		"neovim/nvim-lspconfig",
		keys = {
			{
				"<F8>",
				vim.lsp.buf.hover,
				desc = "LSP Hover",
			},
			{
				"<F12>",
				vim.lsp.buf.rename,
				desc = "LSP Rename",
			},
			{
				"<leader>ld",
				vim.lsp.buf.definition,
				desc = "Go to definition",
			},
			{
				"<leader>la",
				vim.lsp.buf.code_action,
				desc = "Code actions",
			},
			{
				"<leader>lr",
				"<cmd>Telescope lsp_references<cr>",
				desc = "References",
			},
			{
				"<leader>lw",
				"<cmd>Telescope lsp_workspace_diagnostics<cr>",
				desc = "Workspace Diagnostics",
			},
			{
				"<leader>li",
				vim.lsp.buf.implementation,
				desc = "Goto Implementation",
			},
			{
				"<leader>lI",
				"<cmd>LspInfo<cr>",
				desc = "LSP Info",
			},
			{
				"<leader>lF",
				vim.lsp.buf.format,
				desc = "LSP Format",
			},
			{
				"<leader>lf",
				vim.diagnostic.open_float,
				desc = "Open Float",
			},
			{
				"<leader>lq",
				vim.diagnostic.set_loclist,
				desc = "Quickfix",
			},
			{
				"<leader>ls",
				"<cmd>Telescope lsp_document_symbols<cr>",
				desc = "Document Symbols",
			},
			{
				"<leader>lS",
				"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
				desc = "Workspace Symbols",
			},
		},
		config = function()
			vim.diagnostic.config({
				virtual_text = false,
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.ruff.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
					},
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client == nil then
						return
					end
					if client.name == "ruff" then
						-- Disable hover in favor of Pyright
						client.server_capabilities.hoverProvider = false
					end
				end,
				desc = "LSP: Disable hover capability from Ruff",
			})

			local wk = require("which-key")
			wk.add({
				{
					"<leader>l",
					group = "LSP",
				},
			})
		end,
	},
}
