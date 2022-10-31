local lsp = require "lspconfig"
local lsp_status = require "lsp-status"
local cmp_capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local capabilities = vim.tbl_extend('keep', cmp_capabilities, lsp_status.capabilities)

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
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
}
lsp.ltex.setup { capabilities = capabilities }

-- format buffer on save
-- neoformat
vim.cmd [[augroup fmt
          autocmd!
          autocmd BufWritePre * undojoin | Neoformat | lua vim.lsp.buf.format()
          augroup END]]
