local lsp = require "lspconfig"
local coq = require "coq"
local dap = require "dap"


lsp.hls.setup{}
lsp.pyright.setup{}
lsp.bashls.setup{}
lsp.ccls.setup{}
dap.adapters.lldb = {
  type = 'executable',
  command = 'lldb-vscode', -- adjust as needed
  name = "lldb"
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

    -- 💀
    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html

    runInTerminal = false,

    -- 💀
    -- If you use `runInTerminal = true` and resize the terminal window,
    -- lldb-vscode will receive a `SIGWINCH` signal which can cause problems
    -- To avoid that uncomment the following option
    -- See https://github.com/mfussenegger/nvim-dap/issues/236#issuecomment-1066306073
    postRunCommands = {'process handle -p true -s false -n false SIGWINCH'}
  },
}


-- If you want to use this for rust and c, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

lsp.rls.setup{}
lsp.texlab.setup{}
lsp.r_language_server.setup{}
lsp.html.setup{coq.lsp_ensure_capabilities()}
lsp.eslint.setup{}
lsp.gdscript.setup{}
lsp.r_language_server.setup{}
lsp.emmet_ls.setup{coq.lsp_ensure_capabilities()}
lsp.rnix.setup{}

-- lua language server setup
require'lspconfig'.sumneko_lua.setup{}
