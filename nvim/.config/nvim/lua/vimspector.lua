-- vim.api.nvim_exec(
-- [[
-- let g:vimspector_enable_mappings = 'HUMAN'

-- let g:vimspector_intall_gadgets = [
--   'debugpy', 'CodeLLDB'
-- ]
-- ]]
-- )

vim.g.vimspector_enable_mappings = 'HUMAN'
vim.g.vimspector_intall_gadgets = { 'debugpy', 'CodeLLDB' }
vim.g.mapleader = ' '

local map = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }
map('n', '<leader>dl', '<cmd>call vimspector#Launch()<CR>', opts)
map('n', '<leader>dr', '<cmd>VimspectorReset<CR>', opts)
map('n', '<leader>de', '<cmd>VimspectorEval<CR>', opts)
map('n', '<leader>dw', '<cmd>VimspectorWatch<CR>', opts)
map('n', '<leader>do', '<cmd>VimspectorShowOutput<CR>', opts)
map('n', '<leader>di', '<cmd>VimspectorBalloonEval<CR>', opts)
map('x', '<leader>di', '<cmd>VimspectorBalloonEval<CR>', opts)

