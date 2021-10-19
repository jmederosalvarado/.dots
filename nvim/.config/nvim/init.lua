--[[
	TODO: check out this plugins
	- welle/targets.vim (and other text-object related)
	- iamcco/markdown-preview.nvim & npxbr/glow.nvim & plasticboy/vim-markdown
	- simrat39/symbols-outline.nvim
	- simrat39/rust-tools.nvim
--]]

local use_config = function(configs)
	configs = type(configs) == "table" and configs or { configs }
	return table.concat(
		vim.tbl_map(function(value)
			return string.format([[require('%s')]], value)
		end, configs),
		"; "
	)
end

local use_setup = function(names)
	names = type(names) == "table" and names or { names }
	return table.concat(
		vim.tbl_map(function(value)
			return string.format([[require('%s').setup({})]], value)
		end, names),
		"; "
	)
end

local use_config_viml = function(configs)
	configs = type(configs) == "table" and configs or { configs }
	return table.concat(
		vim.tbl_map(function(value)
			return string.format([[vim.cmd('runtime %s')]], value)
		end, configs),
		"; "
	)
end

local plugins = function(use)
	use("wbthomason/packer.nvim")

	use({
		"neoclide/coc.nvim",
		branch = "release",
		config = use_config_viml("config/coc.vim"),
		disable = true,
	})

	use({
		"neovim/nvim-lspconfig",
		requires = {
			-- "nvim-lua/lsp_extensions.nvim",
			"kabouzeid/nvim-lspinstall",
			"folke/lua-dev.nvim",
			"jose-elias-alvarez/null-ls.nvim",
			"jose-elias-alvarez/nvim-lsp-ts-utils",
			"folke/trouble.nvim",
			{
				"kosayoda/nvim-lightbulb",
				config = use_config("config.lightbulb"),
			},
			{
				"hrsh7th/nvim-cmp",
				requires = {
					"hrsh7th/cmp-buffer",
					"hrsh7th/cmp-path",
					"hrsh7th/cmp-nvim-lsp",
					-- "hrsh7th/cmp-vsnip",
					-- "hrsh7th/vim-vsnip",
					"L3MON4D3/LuaSnip",
					"saadparwaiz1/cmp_luasnip",
					"rafamadriz/friendly-snippets",
					"onsails/lspkind-nvim",
					"windwp/nvim-autopairs",
					"windwp/nvim-ts-autotag",
				},
				config = use_config("config.cmp"),
			},
		},
		config = use_config({ "fixes.lsp", "config.lsp" }),
		disable = false,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		requires = {
			"nvim-treesitter/playground",
			"nvim-treesitter/nvim-treesitter-textobjects",
			"RRethy/nvim-treesitter-textsubjects",
		},
		config = use_config({ "fixes.treesitter", "config.treesitter" }),
	})

	use({
		"nvim-telescope/telescope.nvim",
		config = use_config("config.telescope"),
		requires = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
		},
	})

	-- git {{{

	use({
		"tpope/vim-fugitive",
		requires = {
			"tpope/vim-rhubarb",
		},
	})
	use({
		"pwntester/octo.nvim",
		config = function()
			require("octo").setup()
		end,
	})
	use({
		"TimUntersberger/neogit",
		requires = "nvim-lua/plenary.nvim",
	})
	use("sindrets/diffview.nvim")
	use({
		"lewis6991/gitsigns.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = use_setup("gitsigns"),
	})

	-- }}}

	-- appearance {{{

	use({
		"rktjmp/lush.nvim",
	})
	use({
		-- "ful1e5/onedark.nvim",
		-- "Pocco81/Catppuccino.nvim",
		"folke/tokyonight.nvim",
		requires = {
			-- other ui themes
			"hoob3rt/lualine.nvim",
			"kyazdani42/nvim-tree.lua",
		},
		config = use_config({ "config.lualine", "config.tree", "config.colors" }),
	})
	use({ "romgrk/barbar.nvim", disable = true })
	use({
		"karb94/neoscroll.nvim",
		config = use_setup("neoscroll"),
		disable = true,
	})
	use("psliwka/vim-smoothie")
	use({
		"edluffy/specs.nvim",
		config = use_setup("specs"),
	})
	use({
		"folke/zen-mode.nvim",
		config = use_setup("zen-mode"),
		requires = {
			"folke/twilight.nvim",
		},
	})
	use({
		"folke/todo-comments.nvim",
		config = use_setup("todo-comments"),
	})
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({
				char = "┆", -- '|', '¦', '┆', '┊'
				filetype_exclude = { "packer", "help" },
				buftype_exclude = { "terminal" },
				-- bufname = { "terminal" },
				show_current_context = true,
				space_char_blankline = " ",
				use_treesitter = true,
				show_trailing_blankline_indent = false,
			})
		end,
		disable = false,
	})
	use({
		"norcalli/nvim-colorizer.lua",
		config = use_setup("colorizer"),
	})
	use("kyazdani42/nvim-web-devicons")

	-- }}}

	-- misc {{{

	use("tpope/vim-commentary")
	use("tpope/vim-surround")
	use("tpope/vim-repeat")
	use("tpope/vim-eunuch")
	use("tpope/vim-unimpaired")
	use("tpope/vim-abolish")
	-- use("tpope/vim-sleuth")
	use("tpope/vim-obsession")
	use({
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				pre_save_cmds = { "tabdo NvimTreeClose" },
			})
		end,
	})
	use("ggandor/lightspeed.nvim")
	use("andymass/vim-matchup")
	use("tjdevries/astronauta.nvim")
	use("tomlion/vim-solidity")
	use("wellle/targets.vim")
	-- practice
	use({
		"takac/vim-hardtime",
		config = function()
			-- vim.g.hardtime_default_on = 1
		end,
	})
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && yarn install",
	})

	-- }}}
end

require("packer").startup({
	plugins,
	config = {
		display = {
			profile = true,
			open_fn = function()
				return require("packer.util").float({ border = "solid" })
			end,
		},
	},
})

vim.cmd("runtime plugin/astronauta.vim")

require("config.options")
require("config.mappings")

vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank()")
