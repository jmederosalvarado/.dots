local use_setup = function(name)
	return string.format([[require('%s').setup()]], name)
end

local use_config = function(config)
	return string.format([[require('plugins.configs')('%s')]], config)
end

local not_vscode = [[not vim.g.vscode]]

local specs = function(use)
	use("nvim-lua/plenary.nvim")

	-- LSP {{{

	use({
		"neovim/nvim-lspconfig",
		config = use_config("lsp"),
		after = {
			"nvim-lsp-installer",
			"lua-dev.nvim",
			"null-ls.nvim",
			"nvim-lsp-ts-utils",
			"trouble.nvim",
			"lsp_signature.nvim",
		},
		requires = {
			{ "williamboman/nvim-lsp-installer", cond = not_vscode },
			{ "folke/lua-dev.nvim", cond = not_vscode },
			{ "jose-elias-alvarez/null-ls.nvim", cond = not_vscode },
			{ "jose-elias-alvarez/nvim-lsp-ts-utils", cond = not_vscode },
			{ "folke/trouble.nvim", cond = not_vscode },
			{
				"ray-x/lsp_signature.nvim",
				cond = not_vscode,
				config = use_config("lsp_signature"),
			},
		},
	})

	-- }}}

	-- COMPLETION {{{

	use({
		"hrsh7th/nvim-cmp",
		config = use_config("cmp"),
		after = {
			"nvim-autopairs",

			"friendly-snippets",
			"LuaSnip",
		},
		requires = {
			{ "windwp/nvim-autopairs", cond = not_vscode },

			{ "rafamadriz/friendly-snippets", cond = not_vscode },
			{ "L3MON4D3/LuaSnip", cond = not_vscode },

			{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
			{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
			{ "hrsh7th/cmp-path", after = "nvim-cmp" },
			{ "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
		},
	})

	-- }}}

	-- TREESITTER {{{

	use({
		"nvim-treesitter/nvim-treesitter",
		cond = not_vscode,
		config = use_config("treesitter"),
	})

	-- }}}

	-- NAVIGATION {{{

	use({
		"nvim-telescope/telescope.nvim",
		after = "telescope-fzf-native.nvim",
		requires = {
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make", cond = not_vscode },
		},
		config = use_config("telescope"),
	})

	use({
		"ThePrimeagen/harpoon",
		config = use_config("harpoon"),
	})

	-- }}}

	-- GIT {{{

	use({
		"tpope/vim-fugitive",
		cond = not_vscode,
		config = function()
			vim.keymap.set("n", "<leader>gs", "<cmd>G<CR>", { silent = true })
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		cond = not_vscode,
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
			})
		end,
	})

	use({
		"pwntester/octo.nvim",
		cond = not_vscode,
		config = function()
			require("octo").setup()
		end,
		disable = true,
	})

	-- }}}

	-- APPEARANCE {{{

	use({
		"kyazdani42/nvim-web-devicons",
		config = use_config("icons"),
	})

	use({
		"nvim-lualine/lualine.nvim",
		cond = not_vscode,
		requires = "nvim-web-devicons",
		config = use_config("lines"),
	})

	use({
		"akinsho/bufferline.nvim",
		cond = not_vscode,
		requires = "famiu/bufdelete.nvim",
		config = use_config("bufferline"),
		disable = true,
	})

	use({
		"romgrk/barbar.nvim",
		cond = not_vscode,
		disable = true,
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		cond = not_vscode,
		config = use_config("indent_blankline"),
	})

	-- }}}

	-- MISC {{{

	use({
		"kyazdani42/nvim-tree.lua",
		cond = not_vscode,
		config = use_config("tree"),
	})

	use({
		"numToStr/Comment.nvim",
		cond = not_vscode,
		config = use_setup("Comment"),
	})

	use({
		"karb94/neoscroll.nvim",
		cond = not_vscode,
		config = use_setup("neoscroll"),
	})

	use({
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup({
				mapping = "jk",
				timeout = 200,
			})
		end,
	})

	use({
		"akinsho/toggleterm.nvim",
		cond = not_vscode,
		config = use_config("toggleterm"),
		disable = true,
	})

	use("norcalli/nvim-colorizer.lua")

	use("tpope/vim-surround")
	use("tpope/vim-repeat")
	use("tpope/vim-eunuch")
	use("tpope/vim-unimpaired")
	use("tpope/vim-abolish")
	-- use("tpope/vim-sleuth")
	-- use("tpope/vim-obsession")
	use({
		"rmagatti/auto-session",
		cond = not_vscode,
		setup = function()
			vim.o.sessionoptions = vim.o.sessionoptions .. ",winpos,terminal"
		end,
		config = function()
			require("auto-session").setup({
				pre_save_cmds = { "tabdo NvimTreeClose" },
			})
		end,
	})
	use("ggandor/lightspeed.nvim")
	use("andymass/vim-matchup")
	use("wellle/targets.vim")
	use({
		"iamcco/markdown-preview.nvim",
		cond = not_vscode,
		run = "cd app && yarn install",
	})

	use({ "tomlion/vim-solidity", cond = not_vscode })

	-- }}}
end

-- }}}

-- PACKER {{{

require("packer").startup({
	function(use)
		use("wbthomason/packer.nvim")
		specs(use)
	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
})

-- }}}
