local lsp = require "lspconfig"
local coq = require "coq"


lsp.hls.setup{}
lsp.pyright.setup{}
lsp.bashls.setup{}
lsp.ccls.setup{}
lsp.rls.setup{}
lsp.texlab.setup{}
lsp.r_language_server.setup{}
lsp.emmet_ls.setup{}
lsp.html.setup{}
lsp.eslint.setup{}
lsp.gdscript.setup{}
lsp.r_language_server.setup{}


-- lua language server setup
local sumneko_root_path = '/usr/lib/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lsp.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
