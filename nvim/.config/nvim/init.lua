require('plugins')
require('keymaps')
require('lspconf')
require('completion')
require('treesitter')
require('vimspector')

-- Telescope Configuration
require('telescope').setup{
  defaults = {
    prompt_prefix = "% ",
    -- preview_cutoff = 1,
    layout_strategy = "flex"
  },
  pickers = {
    find_files = {
      previewer = false
    }
  },
}

local scopes = {o = vim.o, b = vim.bo, w = vim.wo}
local function opt(scope, key, value)
  scopes[scope][key] = value if scope ~= 'o' then
    scopes['o'][key] = value end
end

opt('o', 'number', true) opt('o', 'hlsearch', false)
opt('o', 'hidden', true)
opt('o', 'swapfile', false)
opt('o', 'backup', false)
opt('o', 'undodir', '/home/melo/.config/nvim/undodir')
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

vim.g.indent_guides_enable_on_vim_startup = 1
vim.g.indent_guides_start_level = 2
vim.g.indent_guides_guide_size = 1
vim.g.indent_guides_exclude_filetypes = {'startify'}

vim.api.nvim_exec(
[[
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#ff5f6e' gui=underline ctermfg=81 cterm=underline
augroup END
]]
, true)

-- UI Settings
vim.g.current_mode = {
  n = ' ',
  i = 'i',
  v = 'v',
  V = 'l',
  c = 'c',
  R = 'R',
  Rv = 'Rv'
}

vim.api.nvim_exec(
[[
set statusline=\ %{get(g:current_mode,mode(),'b')}
set statusline+=\ %t
set statusline+=%{&modified?'*':''}
augroup statusline
  autocmd!
  autocmd Colorscheme * hi clear StatusLine
augroup END
]]
, true)

vim.api.nvim_exec(
[[
if (has("nvim"))
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
	set termguicolors
endif
]]
, true)

vim.api.nvim_exec(
[[
au Colorscheme * highlight Comment cterm=italic gui=italic
au BufEnter binarysearch.com_*.txt set filetype=cpp
au BufEnter sqlzoo.net_*.txt set filetype=sql
set guifont=Operator\ Mono:h17

if exists('g:started_by_firenvim')
  set guifont=Operator\ Mono:h10
endif

let hr = (strftime("%H"))
if hr >= str2nr($DAY_START) && hr < str2nr($DAY_END)
  set background=light
  colorscheme one
else
  set background=dark
  colorscheme one
endif
]]
, true)

-- Set cursor to a beam on exit 
vim.api.nvim_exec(
[[
autocmd VimLeave * set guicursor=a:ver20-blinkon0
]]
, true)

-- Autopairs setup
require('nvim-autopairs').setup({
  enable_check_bracket_line = true,
  ignored_next_char = "[%w%.]" -- will ignore alphanumeric and `.` symbol
})

require('nvim-autopairs.completion.compe').setup({
  map_cr = true,
  map_complete = true
})
