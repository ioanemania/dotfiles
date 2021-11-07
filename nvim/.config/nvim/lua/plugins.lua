local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

-- For creating mappings
map = vim.api.nvim_set_keymap
opts = { noremap=true, silent=true }

require('packer').startup(function()
  use { 'wbthomason/packer.nvim' } -- Package Manager

  use { -- Telescope
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} },
      config = function() require('mtelescope') end
  }

  use { -- Completion Engine
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
    },
    config = function() require('mcmp') end
  }

  use {
    'neovim/nvim-lspconfig',
    config = [[require 'lspconf']]
   }

   use {
     'glepnir/lspsaga.nvim',
     requires = { 'neovim/nvim-lspconfig' }
   }

  use { -- Colorschemes
    'rakr/vim-one',
    'sainnhe/everforest',
    'morhetz/gruvbox',
  } 

  use { -- File Explorer
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('nvim-tree').setup()
      map('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', opts)
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require 'mtreesitter' end
  }

  -- use { 
    -- 'famiu/feline.nvim',
    -- config = function() require('feline').setup() end,
  -- }

  use { 
    'glepnir/dashboard-nvim',
    opt = false,
    config = [[vim.g.dashboard_default_executive = 'telescope']]
  }

  -- Window Navigation with C-{h,j,k,l}
  use { 'christoomey/vim-tmux-navigator' } 

  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({
        check_ts = true
      })
    end
  }

  use { 
    'famiu/bufdelete.nvim',
    opt = false,
    config = function() 
      map('n', '<leader>q', '<cmd>lua require("bufdelete").bufdelete(0, true)<cr>', opts)
    end
  }


  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
end)
