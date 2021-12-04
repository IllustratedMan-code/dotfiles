vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  	use 'wbthomason/packer.nvim'
  	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use '9mm/vim-closer'
  	use 'folke/which-key.nvim'
  	use 'shaunsingh/nord.nvim'
  	use {'nvim-neorg/neorg', requires = 'nvim-lua/plenary.nvim'}
  	use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-project.nvim'}}
  	use {'kyazdani42/nvim-tree.lua',requires = 'kyazdani42/nvim-web-devicons'}
  	use {'kristijanhusak/orgmode.nvim', requires = 'akinsho/org-bullets.nvim'}
  	use 'neovim/nvim-lspconfig'
	use {'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim'}
	use {'kassio/neoterm'}
	use {'jubnzv/mdeval.nvim'}
	use {'ms-jpq/coq_nvim', branch='coq'}
	use {'ms-jpq/coq.artifacts', branch='artifacts'}
	use {'lervag/vimtex'}
	use {'ggandor/lightspeed.nvim'}

  	use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  	use {'andymass/vim-matchup'}

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)

  -- Plugins can have dependencies on other plugins

  -- You can specify rocks in isolation
  	use_rocks 'penlight'
  	use_rocks {'lua-resty-http', 'lpeg'}


  -- Plugins can have post-install/update hooks
  	use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}


  -- Post-install/update hook with call of vimscript function with argument
  	use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  -- Use specific branch, dependency and run lua file after load
  	use { 'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
  -- Use dependency and run lua function after load
  	use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  	}

  -- You can specify multiple plugins in a single call
  	use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}

end)

