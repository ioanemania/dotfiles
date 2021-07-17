require('plugins')

local map = vim.api.nvim_set_keymap
vim.g.mapleader = ' '

map('n', '<leader>q', '<cmd>Bdelete<CR>', { noremap=true, silent=true })
map('n', '<leader>/', '<cmd>b#<CR>', { noremap=true, silent=true })
map('n', '<leader>[', '<cmd>bprevious<CR>', { noremap=true, silent=true })
map('n', '<leader>]', '<cmd>bnext<CR>', { noremap=true, silent=true })

-- Telescope mappings
map('n', '<leader>.', '<cmd>Telescope find_files<CR>', { noremap=true, silent=true })
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { noremap=true, silent=true })
