require("which-key").setup {}
functions = require("myfunctions")

local wk = require("which-key")
wk.register({
        c = {
         name = "config",
                r = {"<cmd>source $MYVIMRC<cr>", "reload config"},
                e = { functions.findConfig, "edit config"},
        },
        f = {
                name = "file",
                s = {"<cmd>w<cr>", "save file"},
				f = {require('telescope.builtin').file_browser, "find file"},
        },
		p = {
				name = "projects",
				c = {"<cmd>cd %:p:h<cr>", "change wd to cd"},
				f = {require('telescope.builtin').find_files, "find file"},
				b = {require('telescope.builtin').buffers, "list buffers"},
				p = {function () require('telescope').extensions.project.project{} end, "list projects"},
			},
        w = {"<c-w>", "window", noremap=false},
	t = {"<cmd>NvimTreeToggle<cr>", "tree"}
}, {prefix = "<leader>"})

local custom_lsp_attach = function(client)
vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.defintion()<CR>', {noremap = true})
vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
vim.cmd [[hi link WhichKeyValue Question]]
end
