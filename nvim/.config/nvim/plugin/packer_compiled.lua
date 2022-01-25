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
local package_path_str = "/home/jmederos/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/jmederos/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/jmederos/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/jmederos/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/jmederos/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
  ["Comment.nvim"] = {
    cond = { "return not vim.g.vscode" },
    config = { "require('Comment').setup()" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/opt/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    after = { "nvim-cmp" },
    cond = { "return not vim.g.vscode" },
    loaded = false,
    needs_bufread = true,
    only_cond = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/opt/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["auto-session"] = {
    cond = { "return not vim.g.vscode" },
    config = { "\27LJ\2\no\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\18pre_save_cmds\1\0\0\1\2\0\0\24tabdo NvimTreeClose\nsetup\17auto-session\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/opt/auto-session",
    url = "https://github.com/rmagatti/auto-session"
  },
  ["better-escape.nvim"] = {
    config = { "\27LJ\2\nX\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\ftimeout\3È\1\fmapping\ajk\nsetup\18better_escape\frequire\0" },
    loaded = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/start/better-escape.nvim",
    url = "https://github.com/max397574/better-escape.nvim"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/jmederos/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    after_files = { "/home/jmederos/.local/share/nvim/site/pack/packer/opt/cmp-cmdline/after/plugin/cmp_cmdline.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/opt/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/home/jmederos/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after_files = { "/home/jmederos/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after_files = { "/home/jmederos/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    after_files = { "/home/jmederos/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["friendly-snippets"] = {
    after = { "nvim-cmp" },
    cond = { "return not vim.g.vscode" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/opt/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    cond = { "return not vim.g.vscode" },
    config = { "\27LJ\2\nQ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\23current_line_blame\2\nsetup\rgitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  harpoon = {
    config = { "require('plugins.configs')('harpoon')" },
    loaded = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["indent-blankline.nvim"] = {
    cond = { "return not vim.g.vscode" },
    config = { "require('plugins.configs')('indent_blankline')" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lightspeed.nvim"] = {
    loaded = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/start/lightspeed.nvim",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  ["lsp_signature.nvim"] = {
    after = { "nvim-lspconfig" },
    cond = { "return not vim.g.vscode" },
    config = { "require('plugins.configs')('lsp_signature')" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lua-dev.nvim"] = {
    after = { "nvim-lspconfig" },
    cond = { "return not vim.g.vscode" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/opt/lua-dev.nvim",
    url = "https://github.com/folke/lua-dev.nvim"
  },
  ["lualine.nvim"] = {
    cond = { "return not vim.g.vscode" },
    config = { "require('plugins.configs')('lines')" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    cond = { "return not vim.g.vscode" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["neoscroll.nvim"] = {
    cond = { "return not vim.g.vscode" },
    config = { "require('neoscroll').setup()" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/opt/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  ["null-ls.nvim"] = {
    after = { "nvim-lspconfig" },
    cond = { "return not vim.g.vscode" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/opt/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    after = { "nvim-cmp" },
    cond = { "return not vim.g.vscode" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-nvim-lua", "cmp-path", "cmp_luasnip", "cmp-buffer", "cmp-cmdline", "cmp-nvim-lsp" },
    config = { "require('plugins.configs')('cmp')" },
    load_after = {
      LuaSnip = true,
      ["friendly-snippets"] = true,
      ["nvim-autopairs"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lsp-installer"] = {
    after = { "nvim-lspconfig" },
    cond = { "return not vim.g.vscode" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/opt/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lsp-ts-utils"] = {
    after = { "nvim-lspconfig" },
    cond = { "return not vim.g.vscode" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/opt/nvim-lsp-ts-utils",
    url = "https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    config = { "require('plugins.configs')('lsp')" },
    load_after = {
      ["lsp_signature.nvim"] = true,
      ["lua-dev.nvim"] = true,
      ["null-ls.nvim"] = true,
      ["nvim-lsp-installer"] = true,
      ["nvim-lsp-ts-utils"] = true,
      ["trouble.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    cond = { "return not vim.g.vscode" },
    config = { "require('plugins.configs')('tree')" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    cond = { "return not vim.g.vscode" },
    config = { "require('plugins.configs')('treesitter')" },
    loaded = false,
    needs_bufread = true,
    only_cond = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    config = { "require('plugins.configs')('icons')" },
    loaded = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    cond = { "return not vim.g.vscode" },
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tocto\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/opt/octo.nvim",
    url = "https://github.com/pwntester/octo.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope-fzf-native.nvim"] = {
    after = { "telescope.nvim" },
    cond = { "return not vim.g.vscode" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "require('plugins.configs')('telescope')" },
    load_after = {
      ["telescope-fzf-native.nvim"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    after = { "nvim-lspconfig" },
    cond = { "return not vim.g.vscode" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/opt/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/start/vim-abolish",
    url = "https://github.com/tpope/vim-abolish"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/start/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-fugitive"] = {
    cond = { "return not vim.g.vscode" },
    config = { "\27LJ\2\n]\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\15<cmd>G<CR>\15<leader>gs\6n\bset\vkeymap\bvim\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/opt/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/start/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-solidity"] = {
    cond = { "return not vim.g.vscode" },
    loaded = false,
    needs_bufread = true,
    only_cond = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/opt/vim-solidity",
    url = "https://github.com/tomlion/vim-solidity"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/jmederos/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: auto-session
time([[Setup for auto-session]], true)
try_loadstring("\27LJ\2\nQ\0\0\3\0\4\0\t6\0\0\0009\0\1\0006\1\0\0009\1\1\0019\1\2\1'\2\3\0&\1\2\1=\1\2\0K\0\1\0\21,winpos,terminal\19sessionoptions\6o\bvim\0", "setup", "auto-session")
time([[Setup for auto-session]], false)
-- Config for: better-escape.nvim
time([[Config for better-escape.nvim]], true)
try_loadstring("\27LJ\2\nX\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\ftimeout\3È\1\fmapping\ajk\nsetup\18better_escape\frequire\0", "config", "better-escape.nvim")
time([[Config for better-escape.nvim]], false)
-- Config for: harpoon
time([[Config for harpoon]], true)
require('plugins.configs')('harpoon')
time([[Config for harpoon]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
require('plugins.configs')('icons')
time([[Config for nvim-web-devicons]], false)
-- Conditional loads
time([[Conditional loading of lsp_signature.nvim]], true)
  require("packer.load")({"lsp_signature.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of lsp_signature.nvim]], false)
time([[Conditional loading of nvim-autopairs]], true)
  require("packer.load")({"nvim-autopairs"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-autopairs]], false)
time([[Conditional loading of friendly-snippets]], true)
  require("packer.load")({"friendly-snippets"}, {}, _G.packer_plugins)
time([[Conditional loading of friendly-snippets]], false)
time([[Conditional loading of LuaSnip]], true)
  require("packer.load")({"LuaSnip"}, {}, _G.packer_plugins)
time([[Conditional loading of LuaSnip]], false)
time([[Conditional loading of gitsigns.nvim]], true)
  require("packer.load")({"gitsigns.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of gitsigns.nvim]], false)
time([[Conditional loading of indent-blankline.nvim]], true)
  require("packer.load")({"indent-blankline.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of indent-blankline.nvim]], false)
time([[Conditional loading of octo.nvim]], true)
  require("packer.load")({"octo.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of octo.nvim]], false)
time([[Conditional loading of vim-solidity]], true)
  require("packer.load")({"vim-solidity"}, {}, _G.packer_plugins)
time([[Conditional loading of vim-solidity]], false)
time([[Conditional loading of lualine.nvim]], true)
  require("packer.load")({"lualine.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of lualine.nvim]], false)
time([[Conditional loading of markdown-preview.nvim]], true)
  require("packer.load")({"markdown-preview.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of markdown-preview.nvim]], false)
time([[Conditional loading of neoscroll.nvim]], true)
  require("packer.load")({"neoscroll.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of neoscroll.nvim]], false)
time([[Conditional loading of nvim-lsp-ts-utils]], true)
  require("packer.load")({"nvim-lsp-ts-utils"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-lsp-ts-utils]], false)
time([[Conditional loading of nvim-treesitter]], true)
  require("packer.load")({"nvim-treesitter"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-treesitter]], false)
time([[Conditional loading of Comment.nvim]], true)
  require("packer.load")({"Comment.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of Comment.nvim]], false)
time([[Conditional loading of vim-fugitive]], true)
  require("packer.load")({"vim-fugitive"}, {}, _G.packer_plugins)
time([[Conditional loading of vim-fugitive]], false)
time([[Conditional loading of telescope-fzf-native.nvim]], true)
  require("packer.load")({"telescope-fzf-native.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of telescope-fzf-native.nvim]], false)
time([[Conditional loading of auto-session]], true)
  require("packer.load")({"auto-session"}, {}, _G.packer_plugins)
time([[Conditional loading of auto-session]], false)
time([[Conditional loading of nvim-tree.lua]], true)
  require("packer.load")({"nvim-tree.lua"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-tree.lua]], false)
time([[Conditional loading of nvim-lsp-installer]], true)
  require("packer.load")({"nvim-lsp-installer"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-lsp-installer]], false)
time([[Conditional loading of lua-dev.nvim]], true)
  require("packer.load")({"lua-dev.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of lua-dev.nvim]], false)
time([[Conditional loading of null-ls.nvim]], true)
  require("packer.load")({"null-ls.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of null-ls.nvim]], false)
time([[Conditional loading of trouble.nvim]], true)
  require("packer.load")({"trouble.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of trouble.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
