local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

require('packer').startup(function()
-- LSP
use { 'neovim/nvim-lspconfig' }
use { 'hrsh7th/nvim-compe' }
use { 'hrsh7th/vim-vsnip' }
use { "ray-x/lsp_signature.nvim" }
use { 
  'glepnir/lspsaga.nvim',
  config = function()
    require('lspsaga').init_lsp_saga()
  end
}
use { 'puremourning/vimspector' }
use { 'onsails/lspkind-nvim' }

-- Treesitter
use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
use { 'nvim-treesitter/playground' }
use { 'nvim-treesitter/nvim-treesitter-refactor' }

-- Rice
use { 'sainnhe/gruvbox-material' }
use { 'Th3Whit3Wolf/one-nvim' }
use { 'rakr/vim-one' }
use { 'atelierbram/Base2Tone-vim' }
use { 'Glench/Vim-Jinja2-Syntax' }
use { 'junegunn/goyo.vim' }
use {
  "folke/zen-mode.nvim",
  config = function()
    require("zen-mode").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}

-- Telescope
use {
  'nvim-telescope/telescope.nvim',
  requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
}

-- Rust
use { 'simrat39/rust-tools.nvim' }

-- -- Which Key
-- use {
--   "folke/which-key.nvim",
--   config = function()
--     require("which-key").setup {
--       -- your configuration comes here
--       -- or leave it empty to use the default settings
--       -- refer to the configuration section below
--     }
--   end
-- }

-- Motions
use { 'moll/vim-bbye' }
use { 'justinmk/vim-sneak' }
use { 'unblevable/quick-scope' }
use { 'tpope/vim-commentary' }
use { 'tpope/vim-surround' }
use { 'windwp/nvim-autopairs' }

-- Git
use { 'mhinz/vim-signify' }
use { 'tpope/vim-fugitive' }

-- Tmux
use { 'christoomey/vim-tmux-navigator' }
use { 'preservim/vimux' }
use { 'nathanaelkane/vim-indent-guides' }

-- Other
use { 'godlygeek/tabular' }
use { 'plasticboy/vim-markdown' }
use { 'mhinz/vim-startify' }
use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
end)
