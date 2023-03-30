local servers = {
	"lua_ls",
	"pyright",
}

local settings = {
    pip = {
        upgrade_pip = true,
    }
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("giatro.plugins.lsp.handlers").on_attach,
		capabilities = require("giatro.plugins.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local conf_opts = require("giatro.plugins.lsp.settings." .. server)
	opts = vim.tbl_deep_extend("force", conf_opts, opts)

	require("lspconfig")[server].setup(opts)
end
