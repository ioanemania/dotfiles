local scopes = {o = vim.o, b = vim.bo, w = vim.wo}
local function opt(scope, key, value)
  scopes[scope][key] = value if scope ~= 'o' then
    scopes['o'][key] = value end
end

opt('o', 'number', true) opt('o', 'hlsearch', false)
opt('o', 'hidden', true)
opt('o', 'swapfile', false)
opt('o', 'backup', false)
-- opt('o', 'undodir', '/home/ioane/.config/nvim/undodir')
opt('o', 'undofile', true)
opt('o', 'incsearch', true)
opt('o', 'inccommand', 'nosplit')
opt('o', 'scrolloff', 8)
opt('o', 'signcolumn', 'yes')
opt('o', 'colorcolumn', '81')
opt('o', 'tabstop', 2)
opt('o', 'softtabstop', 2)
opt('o', 'shiftwidth', 2)
opt('o', 'expandtab', true)
opt('o', 'smartindent', true)
opt('o', 'showmode', false)
opt('o', 'wrap', false)
opt('o', 'updatetime', 50)
opt('o', 'termguicolors', true)
