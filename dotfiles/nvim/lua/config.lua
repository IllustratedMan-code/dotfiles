require('nvim-tree').setup{
	update_cwd = true,
	git = {
		enable = true,
		ignore = false
			},
}

require("sidebar-nvim").setup({
    open = false,
    sections = {"files", "git", "todos", "diagnostics"}
})


local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main"
    },
}
require('orgmode').setup_ts_grammar()
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",-- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
	disable = {},
    additional_vim_regex_highlighting = {'org'},
  },
  indent = {
	  enable = true
  }
}

require('neorg').setup {
	load = {
		["core.defaults"] = {}, -- Load all the default modules
			["core.keybinds"] = {
				config = {
                        default_keybinds = true, -- Generate the default keybinds
                        neorg_leader = "<Leader>m" -- This is the default if unspecified
                    }
			},
            ["core.norg.concealer"] = {}, -- Allows for use of icons
            ["core.norg.dirman"] = { -- Manage your directories with Neorg
                    config = {
                        workspaces = {
                            my_workspace = "~/neorg"
                	}
                }
        	}
	},
}
require('orgmode').setup{}
require("org-bullets").setup {
	symbols = { "◉", "○", "✸", "✿" }
}
require('telescope').setup{
	extensions = {
		file_browser = {
			theme = "ivy"
		}
	}
}
require'telescope'.load_extension('project')
require'telescope'.load_extension('file_browser')
require('neogit').setup{}
vim.o.completeopt = 'menuone,noselect,noinsert'
vim.o.showmode = false

vim.g.coq_settings = { ["auto_start"] = false, ["display.pum.fast_close"] = false, ['keymap.eval_snips'] = '<leader>j', ["completion.always"] = false}

vim.diagnostic.config({
    virtual_text = false,
})
vim.cmd([[au CursorHold * lua vim.diagnostic.open_float(0,{scope = "cursor"})]])
vim.o.updatetime = 300

vim.g.nord_contrast = true


