vim.cmd [[nnoremap <SPACE> <nop>]]
vim.cmd [[vnoremap <SPACE> <nop>]]
vim.cmd [[let mapleader=" "]]
vim.cmd [[let maplocalleader=" m"]]
vim.cmd [[tnoremap <Esc> <C-\><C-n>]]
vim.cmd [[nmap <leader>w <C-w>]]



require("which-key").setup {}

function findConfig()
  require('telescope.builtin').find_files {
    winblend = 5,
    border = true,
    cwd = '~/.config/nvim',
  }
end

local wk = require("which-key")
local telescope = require('telescope.builtin')
wk.register({
  ["<leader>"] = {
    c = {
      name = "config",
      r = { "<cmd>source $MYVIMRC<cr>", "reload config" },
      e = { findConfig, "edit config" },
    },
    f = {
      name = "file",
      s = { "<cmd>w<cr>", "save file" },
      z = { vim.lsp.buf.formatting, "format file" },
      f = { function() require 'telescope'.extensions.file_browser.file_browser() end, "find file" },

    },
    p = {
      name = "projects",
      c = { "<cmd>cd %:p:h<cr>", "change wd to cd" },
      f = { function() require 'telescope'.extensions.file_browser.file_browser() end, "find file" },
      b = { telescope.buffers, "list buffers" },
      p = { function() require('telescope').extensions.project.project {} end, "list projects" },
      t = { telescope.treesitter, "treesitter" },
      g = {
        name = "grep",
        h = { telescope.grep_string, "grep string here" },
        s = { telescope.live_grep, "grep string" },
      },
      e = { function() require('telescope').extensions.conda.conda {} end, "set conda environment" },
      l = {
        name = "lsp",
        a = { "<cmd>CodeActionMenu<cr>", "list actions here" },
        p = {
          name = "problems and diagnostics",
          d = { telescope.diagnostics, "file diagnostics" },
          s = { telescope.lsp_document_symbols, "document symbols" },
          w = { telescope.lsp_workspace_symbols, "workspace symbols" }
        },
        d = { telescope.lsp_definitions, "definition here" },
        f = { vim.lsp.buf.formatting, "format buffer" },
        i = { telescope.lsp_implementation, "implementation here" },
        t = { telescope.lsp_type_definitions, "definition for type here" },
      },
    },
    l = { "<cmd>b#<cr>", "last buffer" },
    w = {
      name = "window",

    },
    g = {
      name = "git",
      g = { require('neogit').open, "git status" },
    },
    m = {
      name = "local-leader",
      s = {
        name = "send",
        l = { "<cmd>TREPLSendLine<cr>", "send line" },
        f = { "<cmd>TREPLSendFile<cr>", "send file" },
      },
    },
    t = { "<cmd>NvimTreeToggle<cr>", "toggle-tree" },
  },
})

wk.register({
  ["<leader>m"] = {
    name = "local-leader",
    v = { "<cmd>TREPLSendSelection<cr>", "send selection", mode = "v" },
  }
}, { mode = "v" })




vim.api.nvim_set_keymap('n', 'z=', '<Cmd>Telescope spell_suggest theme=get_cursor<CR>', { noremap = false })
vim.api.nvim_set_keymap('n', 'zt', '<Cmd>setlocal spell!<CR>', { noremap = false })
vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>Telescope man_pages<CR>', { noremap = false })
