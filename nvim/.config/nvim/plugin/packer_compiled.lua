-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/ioane/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/ioane/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/ioane/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/ioane/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/ioane/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["bufdelete.nvim"] = {
    config = { "\27LJ\2\nm\0\0\6\0\5\0\a6\0\0\0'\2\1\0'\3\2\0'\4\3\0006\5\4\0B\0\5\1K\0\1\0\topts9<cmd>lua require(\"bufdelete\").bufdelete(0, true)<cr>\14<leader>q\6n\bmap\0" },
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/bufdelete.nvim",
    url = "https://github.com/famiu/bufdelete.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\n?\t\0\0\4\0\16\0\0256\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\b\0005\2\6\0005\3\5\0=\3\a\2=\2\t\0015\2\v\0005\3\n\0=\3\a\2=\2\f\1=\1\4\0006\0\0\0009\0\1\0004\1\0\0=\1\r\0006\0\0\0009\0\1\0005\1\15\0=\1\14\0K\0\1\0\1\r\0\0\5\5\5?\1 ????????????   ????????? ???????????????????????? ?????????????????????  ?????????   ????????? ????????? ????????????   ?????????????\1 ???????????????  ????????? ??????????????????????????????????????????????????? ?????????   ????????? ????????? ??????????????? ????????????????\1 ?????????????????? ????????? ??????????????????  ?????????   ????????? ?????????   ????????? ????????? ??????????????????????????????????\1 ?????????????????????????????? ??????????????????  ?????????   ????????? ???????????? ???????????? ????????? ??????????????????????????????????\1 ????????? ?????????????????? ???????????????????????????????????????????????????  ?????????????????????  ????????? ????????? ????????? ??????????\1 ?????????  ??????????????? ???????????????????????? ?????????????????????    ???????????????   ????????? ?????????     ?????????\5\5\5\28dashboard_custom_header\28dashboard_custom_footer\6b\1\0\1\fcommand\23Telescope projects\1\2\0\0\30Recent Projects   SPC f p\6a\1\0\0\16description\1\0\1\fcommand\25Telescope find_files\1\2\0\0\30Find File         SPC f f\29dashboard_custom_section\14telescope dashboard_default_executive\6g\bvim\0" },
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/dashboard-nvim",
    url = "https://github.com/glepnir/dashboard-nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n?\4\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\2B\0\2\1K\0\1\0\nsigns\1\0\0\17changedelete\1\0\4\ttext\6~\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\14topdelete\1\0\4\ttext\b???\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\vdelete\1\0\4\ttext\6_\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\vchange\1\0\4\ttext\b???\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\badd\1\0\0\1\0\4\ttext\b???\ahl\16GitSignsAdd\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/gruvbox",
    url = "https://github.com/morhetz/gruvbox"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  harpoon = {
    config = { "\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rmharpoon\frequire\0" },
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n?\2\0\0\4\0\14\0\0226\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0009\0\3\0\18\2\0\0009\0\4\0'\3\5\0B\0\3\0016\0\6\0'\2\a\0B\0\2\0029\0\b\0005\2\t\0005\3\n\0=\3\v\0025\3\f\0=\3\r\2B\0\2\1K\0\1\0\21filetype_exclude\1\2\0\0\14dashboard\20buftype_exclude\1\2\0\0\rterminal\1\0\2\tchar\b???\25show_current_context\2\nsetup\21indent_blankline\frequire\feol:???\vappend\14listchars\tlist\bopt\bvim\0" },
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lightspeed.nvim"] = {
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/lightspeed.nvim",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n?\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\foptions\1\0\0\23section_separators\1\0\2\nright\b???\tleft\b???\25component_separators\1\0\0\1\0\2\nright\5\tleft\5\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  melange = {
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/melange",
    url = "https://github.com/savq/melange"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\rcheck_ts\2\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n$\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\tmcmp\frequire\0" },
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-comment"] = {
    config = { "require 'nvim_comment'.setup()" },
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/nvim-comment",
    url = "https://github.com/terrortylor/nvim-comment"
  },
  ["nvim-lspconfig"] = {
    config = { "require 'lspconf'" },
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n2\0\0\4\0\3\0\0066\0\0\0006\1\2\0'\3\1\0B\1\2\2=\1\1\0K\0\1\0\frequire\vnotify\bvim\0" },
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n?\1\0\0\6\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0016\0\6\0'\2\a\0'\3\b\0'\4\t\0006\5\n\0B\0\5\1K\0\1\0\topts\28<cmd>NvimTreeToggle<CR>\n<C-n>\6n\bmap\24update_focused_file\1\0\2\venable\2\15update_cwd\2\1\0\2\20respect_buf_cwd\2\15update_cwd\2\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16mtreesitter\frequire\0" },
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/ful1e5/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\2\n?\1\0\0\6\0\f\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0029\0\5\0'\2\6\0B\0\2\0016\0\a\0'\2\b\0'\3\t\0'\4\n\0006\5\v\0B\0\5\1K\0\1\0\topts <cmd>Telescope projects<cr>\15<leader>fp\6n\bmap\rprojects\19load_extension\14telescope\1\0\1\16manual_mode\2\nsetup\17project_nvim\frequire\0" },
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15mtelescope\frequire\0" },
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n?\1\0\0\6\0\v\0\0246\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0'\2\4\0'\3\5\0'\4\6\0006\5\a\0B\0\5\0016\0\3\0'\2\b\0'\3\5\0'\4\6\0006\5\a\0B\0\5\0016\0\3\0'\2\4\0'\3\t\0'\4\n\0006\5\a\0B\0\5\1K\0\1\0<<cmd>TermExec cmd=\"lazygit && exit\" direction=float<CR>\15<leader>tg\6t\topts(<cmd>ToggleTerm direction=float<CR>\v<M-BS>\6n\bmap\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  vimspector = {
    loaded = true,
    path = "/home/ioane/.local/share/nvim/site/pack/packer/start/vimspector",
    url = "https://github.com/puremourning/vimspector"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n?\4\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\2B\0\2\1K\0\1\0\nsigns\1\0\0\17changedelete\1\0\4\ttext\6~\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\14topdelete\1\0\4\ttext\b???\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\vdelete\1\0\4\ttext\6_\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\vchange\1\0\4\ttext\b???\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\badd\1\0\0\1\0\4\ttext\b???\ahl\16GitSignsAdd\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-comment
time([[Config for nvim-comment]], true)
require 'nvim_comment'.setup()
time([[Config for nvim-comment]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require 'lspconf'
time([[Config for nvim-lspconfig]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n?\1\0\0\6\0\v\0\0246\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0'\2\4\0'\3\5\0'\4\6\0006\5\a\0B\0\5\0016\0\3\0'\2\b\0'\3\5\0'\4\6\0006\5\a\0B\0\5\0016\0\3\0'\2\4\0'\3\t\0'\4\n\0006\5\a\0B\0\5\1K\0\1\0<<cmd>TermExec cmd=\"lazygit && exit\" direction=float<CR>\15<leader>tg\6t\topts(<cmd>ToggleTerm direction=float<CR>\v<M-BS>\6n\bmap\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\nM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\rcheck_ts\2\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\n2\0\0\4\0\3\0\0066\0\0\0006\1\2\0'\3\1\0B\1\2\2=\1\1\0K\0\1\0\frequire\vnotify\bvim\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n?\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\foptions\1\0\0\23section_separators\1\0\2\nright\b???\tleft\b???\25component_separators\1\0\0\1\0\2\nright\5\tleft\5\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n$\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\tmcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
try_loadstring("\27LJ\2\n?\t\0\0\4\0\16\0\0256\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\b\0005\2\6\0005\3\5\0=\3\a\2=\2\t\0015\2\v\0005\3\n\0=\3\a\2=\2\f\1=\1\4\0006\0\0\0009\0\1\0004\1\0\0=\1\r\0006\0\0\0009\0\1\0005\1\15\0=\1\14\0K\0\1\0\1\r\0\0\5\5\5?\1 ????????????   ????????? ???????????????????????? ?????????????????????  ?????????   ????????? ????????? ????????????   ?????????????\1 ???????????????  ????????? ??????????????????????????????????????????????????? ?????????   ????????? ????????? ??????????????? ????????????????\1 ?????????????????? ????????? ??????????????????  ?????????   ????????? ?????????   ????????? ????????? ??????????????????????????????????\1 ?????????????????????????????? ??????????????????  ?????????   ????????? ???????????? ???????????? ????????? ??????????????????????????????????\1 ????????? ?????????????????? ???????????????????????????????????????????????????  ?????????????????????  ????????? ????????? ????????? ??????????\1 ?????????  ??????????????? ???????????????????????? ?????????????????????    ???????????????   ????????? ?????????     ?????????\5\5\5\28dashboard_custom_header\28dashboard_custom_footer\6b\1\0\1\fcommand\23Telescope projects\1\2\0\0\30Recent Projects   SPC f p\6a\1\0\0\16description\1\0\1\fcommand\25Telescope find_files\1\2\0\0\30Find File         SPC f f\29dashboard_custom_section\14telescope dashboard_default_executive\6g\bvim\0", "config", "dashboard-nvim")
time([[Config for dashboard-nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n?\1\0\0\6\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0016\0\6\0'\2\a\0'\3\b\0'\4\t\0006\5\n\0B\0\5\1K\0\1\0\topts\28<cmd>NvimTreeToggle<CR>\n<C-n>\6n\bmap\24update_focused_file\1\0\2\venable\2\15update_cwd\2\1\0\2\20respect_buf_cwd\2\15update_cwd\2\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: harpoon
time([[Config for harpoon]], true)
try_loadstring("\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rmharpoon\frequire\0", "config", "harpoon")
time([[Config for harpoon]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\n?\1\0\0\6\0\f\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0029\0\5\0'\2\6\0B\0\2\0016\0\a\0'\2\b\0'\3\t\0'\4\n\0006\5\v\0B\0\5\1K\0\1\0\topts <cmd>Telescope projects<cr>\15<leader>fp\6n\bmap\rprojects\19load_extension\14telescope\1\0\1\16manual_mode\2\nsetup\17project_nvim\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: bufdelete.nvim
time([[Config for bufdelete.nvim]], true)
try_loadstring("\27LJ\2\nm\0\0\6\0\5\0\a6\0\0\0'\2\1\0'\3\2\0'\4\3\0006\5\4\0B\0\5\1K\0\1\0\topts9<cmd>lua require(\"bufdelete\").bufdelete(0, true)<cr>\14<leader>q\6n\bmap\0", "config", "bufdelete.nvim")
time([[Config for bufdelete.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16mtreesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n?\2\0\0\4\0\14\0\0226\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0009\0\3\0\18\2\0\0009\0\4\0'\3\5\0B\0\3\0016\0\6\0'\2\a\0B\0\2\0029\0\b\0005\2\t\0005\3\n\0=\3\v\0025\3\f\0=\3\r\2B\0\2\1K\0\1\0\21filetype_exclude\1\2\0\0\14dashboard\20buftype_exclude\1\2\0\0\rterminal\1\0\2\tchar\b???\25show_current_context\2\nsetup\21indent_blankline\frequire\feol:???\vappend\14listchars\tlist\bopt\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15mtelescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
