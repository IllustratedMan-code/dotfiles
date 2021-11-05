require('nvim-tree').setup{
	update_cwd = true,
}

local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main"
    },
}
parser_configs.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'main',
    files = {'src/parser.c', 'src/scanner.cc'},
  },
  filetype = 'org',
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",-- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
	disable = {'org'},
    additional_vim_regex_highlighting = {'org'},
  },
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
require'telescope'.load_extension('project')

require('nord').set()
vim.cmd [[hi link WhichKeyValue Question]]

