local lsp = require "lspconfig"
local coq = require "coq"


lsp.hls.setup{coq.lsp_ensure_capabilities()}
lsp.pyright.setup{coq.lsp_ensure_capabilities()}
lsp.bashls.setup{coq.lsp_ensure_capabilities()}
lsp.ccls.setup{coq.lsp_ensure_capabilities()}
lsp.rust_analyzer.setup{coq.lsp_ensure_capabilities()}
lsp.texlab.setup{coq.lsp_ensure_capabilities()}
lsp.r_language_server.setup{coq.lsp_ensure_capabilities()}
lsp.html.setup{coq.lsp_ensure_capabilities()}
lsp.eslint.setup{coq.lsp_ensure_capabilities()}
lsp.gdscript.setup{coq.lsp_ensure_capabilities()}
lsp.r_language_server.setup{coq.lsp_ensure_capabilities()}
lsp.emmet_ls.setup{coq.lsp_ensure_capabilities()}
lsp.rnix.setup{coq.lsp_ensure_capabilities()}
lsp.sumneko_lua.setup{coq.lsp_ensure_capabilities()}
