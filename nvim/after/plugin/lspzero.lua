local lsp = require('lsp-zero')

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}
	lsp.default_keymaps({buffer = bufnr})
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		'intelephense',
		'eslint',
	},
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,
	}
})

