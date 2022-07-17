vim.g.mapleader = ' '

local cmd = vim.cmd
local exec = vim.api.nvim_exec

-- Colorscheme setup |
exec([[
  autocmd Colorscheme * highlight Keyword gui=Italic
  autocmd Colorscheme * highlight Comment gui=Italic
]], false)

vim.keymap.set('t', '<C-h>', [[<C-\><C-N><C-w>h]])
vim.keymap.set('t', '<C-j>', [[<C-\><C-N><C-w>j]])
vim.keymap.set('t', '<C-k>', [[<C-\><C-N><C-w>k]])
vim.keymap.set('t', '<C-l>', [[<C-\><C-N><C-w>l]])

cmd [[colorscheme onedark]]
cmd [[set guifont=Operator_Mono_Lig:h15]]


cmd [[autocmd TermOpen * setlocal nonumber norelativenumber]]

require('options') -- General vim options
require('plugins')
require('vimspector-config')
