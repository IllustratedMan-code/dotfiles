vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  	use 'wbthomason/packer.nvim'
  	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'folke/which-key.nvim'
	use 'shaunsingh/nord.nvim'
  	use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-project.nvim', 'IllustratedMan-code/telescope-conda.nvim'}}
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

 	use_rocks 'penlight'
    use_rocks {'lua-resty-http', 'lpeg'}
    use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
	use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  -- Use specific branch, dependency and run lua file after load
    use { 'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
  -- Use dependency and run lua function after load
    use {'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
    }
	use {'tjdevries/colorbuddy.vim'}
 
end)

