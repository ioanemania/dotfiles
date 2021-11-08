require('plugins')
require('options') -- General vim options

vim.g.mapleader = ' '

local cmd = vim.cmd
local exec = vim.api.nvim_exec

-- Colorscheme setup |
exec([[
  autocmd Colorscheme * highlight Keyword gui=Italic
  autocmd Colorscheme * highlight Comment gui=Italic
]], false)

cmd [[colorscheme gruvbox]]
-- |

