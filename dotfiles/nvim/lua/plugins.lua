vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'github/copilot.vim'
  	use 'wbthomason/packer.nvim'
	use 'karb94/neoscroll.nvim'
  	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  	use {'folke/which-key.nvim'}
  	use {'shaunsingh/nord.nvim'}
  	use {'nvim-neorg/neorg', requires = 'nvim-lua/plenary.nvim'}
  	use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-project.nvim', 'IllustratedMan-code/telescope-conda.nvim', 'nvim-telescope/telescope-file-browser.nvim'}}
  	use {'kyazdani42/nvim-tree.lua',requires = 'kyazdani42/nvim-web-devicons'}
    use {'sidebar-nvim/sidebar.nvim'}

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
  	use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
    use {'turbio/bracey.vim', run = 'npm install --prefix server'}
  	use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
  	use { 'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
  	use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  	}
  	use {'tjdevries/colorbuddy.vim'}
	use {'chrisbra/csv.vim'}
    use {'mfussenegger/nvim-dap'}
    use {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.opts)
    end

    }

end)

