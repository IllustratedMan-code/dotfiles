local lsp = require "lspconfig"

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())


lsp.hls.setup { capabilities = capabilities }
lsp.pyright.setup { capabilities = capabilities }
lsp.bashls.setup { capabilities = capabilities }
lsp.ccls.setup { capabilities = capabilities }
lsp.rust_analyzer.setup { capabilities = capabilities }
lsp.texlab.setup { capabilities = capabilities }
lsp.r_language_server.setup { capabilities = capabilities }
lsp.html.setup { capabilities = capabilities }
lsp.eslint.setup { capabilities = capabilities }
lsp.gdscript.setup { capabilities = capabilities }
lsp.emmet_ls.setup { capabilities = capabilities }
lsp.rnix.setup { capabilities = capabilities }
lsp.sumneko_lua.setup {
	capabilities = capabilities,
	Lua = {
		settings = {
			diagnostics = {
				globals = { 'vim' },
			},
		},
	},
}
lsp.ltex.setup { capabilities = capabilities }

-- format buffer on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
