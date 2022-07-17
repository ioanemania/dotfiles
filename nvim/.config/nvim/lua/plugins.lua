local execute = vim.api.nvim_commanh
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

  use {
    'akinsho/toggleterm.nvim',
    config = function() 
      require('toggleterm').setup() 
      map('n', '<M-BS>', '<cmd>ToggleTerm direction=float<CR>', opts)
      map('t', '<M-BS>', '<cmd>ToggleTerm direction=float<CR>', opts)
      map('n', '<leader>tg', '<cmd>TermExec cmd="lazygit && exit" direction=float<CR>', opts)
    end
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

    requires = { 'ray-x/lsp_signature.nvim' },
    config = [[require 'lspconf']]
  }

  use {
    'puremourning/vimspector',
  }

  use {
    'glepnir/lspsaga.nvim',
    requires = { 'neovim/nvim-lspconfig' }
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require 'mtreesitter' end
  }

  use {
    'baabelfish/nvim-nim'
  }

  use {
    'terrortylor/nvim-comment',
    config = [[require 'nvim_comment'.setup()]]
  }

  use { -- Colorschemes
    'savq/melange',
    'rktjmp/lush.nvim',
    'ellisonleao/gruvbox.nvim',
    'ful1e5/onedark.nvim',
  } 

  use { -- File Explorer
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('nvim-tree').setup({
        update_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
          enable = true,
          update_cwd = true
        },
      })

      map('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', opts)
    end
  }

  use {
    'rcarriga/nvim-notify',
    config = function() vim.notify = require('notify') end
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup({
        options = {
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
        }
      })
    end
  }


  use {
    'ahmedkhalf/project.nvim',
    requires = 'nvim-telescope/telescope.nvim',
    config = function()
      require("project_nvim").setup({
        manual_mode = true
      })
      require('telescope').load_extension('projects')
      map('n', '<leader>fp', '<cmd>Telescope projects<cr>', opts)
    end
  }

  use {
    'glepnir/dashboard-nvim',
    opt = false,
    config = function()
      vim.g.dashboard_default_executive = 'telescope'

      vim.g.dashboard_custom_section = {
	      a = { description = {'Find File         SPC f f'}, command = 'Telescope find_files' },
	      b = { description = {'Recent Projects   SPC f p'}, command = 'Telescope projects' },
      }

      vim.g.dashboard_custom_footer = {}

      vim.g.dashboard_custom_header = {
        [[]],
        [[]],
        [[]],
        [[ ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
        [[ ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
        [[ ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
        [[ ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
        [[ ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
        [[ ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
        [[]],
        [[]],
        [[]],
      }
    end
  }

  use { 
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      vim.opt.list = true
      vim.opt.listchars:append("eol:↴")
      require('indent_blankline').setup {
        char = "┊",
        buftype_exclude = {"terminal"},
        filetype_exclude = {"dashboard"},
        show_current_context = true,
      }
    end
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

  -- Harpoon

  use {
    'ThePrimeagen/harpoon',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('mharpoon') end
  }

  -- Git integration
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup {
        signs = {
          -- add          = {hl = 'GitSignsAdd'   , text = '┃', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
          -- change       = {hl = 'GitSignsChange', text = '┃', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
          delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
          topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
          changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        }
      }
    end
  }

  use 'ggandor/lightspeed.nvim'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
end)
