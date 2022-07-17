vim.g.vimspector_enable_mappings = 'HUMAN'
vim.g.vimspector_intall_gadgets = { 'debugpy', 'CodeLLDB' }

vim.keymap.set('n', '<leader>dl', '<cmd>call vimspector#Launch()<CR>')
vim.keymap.set('n', '<leader>dq', '<cmd>call vimspector#Reset()<CR>')
vim.keymap.set('n', '<leader>db', '<cmd>call vimspector#ToggleBreakpoint()<CR>')
vim.keymap.set('n', '<leader>dc', '<cmd>call vimspector#Continue()<CR>')
