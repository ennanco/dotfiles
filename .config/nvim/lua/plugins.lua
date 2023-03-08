--- Ensure the installation of packer
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
      vim.cmd [[packadd packer.nvim]]
      return true
    end
    return false
  end

  local packer_bootstrap = ensure_packer()

--- Installation of the plugins
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    --- Fuzzy finder telescope
    use {
            'nvim-telescope/telescope.nvim', tag = '0.1.0',
	    requires = { {'nvim-lua/plenary.nvim'} }
	}
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 } --- use fzf in the search

    --- Tree sitter
    use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
    use({'nvim-treesitter/nvim-treesitter-textobjects',  --- This plugin add other references for the treesitter
            after = 'nvim-treesitter'
        })
	--- Tokyonight theme options night storm
    use({
	'folke/tokyonight.nvim',
	as = 'tokyonight',
	config = function()
		    vim.cmd('colorscheme tokyonight')
	        end
	})
    use('shaunsingh/nord.nvim')
    use('maxmx03/solarized.nvim')
    use('EdenEast/nightfox.nvim')
    use('kyazdani42/nvim-web-devicons') --- this plugin is mainly for add icons in other plugins
    use('nvim-lualine/lualine.nvim') --- Fancier statusline
    use('kyazdani42/nvim-tree.lua')  --- treeshape explorer

    use('mbbill/undotree')          --- to have an undo tree structure

    use('tpope/vim-fugitive')       --- the control of the git functions inside vim
    use('lewis6991/gitsigns.nvim')  --- Git signs in the lines and additional information

    use('numToStr/Comment.nvim')  --- This plugin helps with the comments key binding 'gc'
    use('tpope/vim-repeat')
    use('tpope/vim-surround')
    use('lukas-reineke/indent-blankline.nvim')
    use('tpope/vim-sleuth')
    use('godlygeek/tabular')

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            -- Snippet Collection (Optional)
            {'rafamadriz/friendly-snippets'},
        }
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
  end)
