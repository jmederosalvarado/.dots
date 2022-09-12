local use_setup = function(name)
	return string.format([[require('%s').setup()]], name)
end

local use_config = function(config)
	return string.format([[require('plugins.configs')('%s')]], config)
end

local not_vscode = [[not vim.g.vscode]]

local build_group_use = function(use, group)
	return function(spec)
		if type(spec) == "string" then
			spec = { spec }
		end
		use(vim.tbl_extend("keep", spec, {
			config = use_config(group),
		}))
	end
end

local specs = function(use)
	use("nvim-lua/plenary.nvim")

	-- use({ "github/copilot.vim" })

	-- COMPLETION {{{

	local use_completion = build_group_use(use, "completion")

	-- main completion plugin
	use_completion("hrsh7th/nvim-cmp")

	-- autocomplete pairs
	use_completion("windwp/nvim-autopairs")

	-- snippets
	use_completion("rafamadriz/friendly-snippets")
	use_completion("L3MON4D3/LuaSnip")

	-- cmp sources
	use_completion("saadparwaiz1/cmp_luasnip")
	use_completion("hrsh7th/cmp-nvim-lua")
	use_completion("hrsh7th/cmp-nvim-lsp")
	use_completion("petertriho/cmp-git")
	use_completion("hrsh7th/cmp-nvim-lsp-signature-help")
	use_completion("hrsh7th/cmp-buffer")
	use_completion("hrsh7th/cmp-path")
	use_completion("hrsh7th/cmp-cmdline")

	-- }}}

	-- LSP {{{

	local use_lsp = build_group_use(use, "lsp")

	use_lsp("neovim/nvim-lspconfig")
	use_lsp("williamboman/nvim-lsp-installer")
	use_lsp("folke/lua-dev.nvim")
	use_lsp("jose-elias-alvarez/null-ls.nvim")
	use_lsp("jose-elias-alvarez/nvim-lsp-ts-utils")
	use_lsp("folke/trouble.nvim")

	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({
				window = {
					-- relative = "win",
					relative = "editor",
					blend = 0,
				},
			})
		end,
	})

	use({ "ray-x/lsp_signature.nvim", config = use_config("lsp_signature") })

	-- }}}

	-- TREESITTER {{{

	local use_treesitter = build_group_use(use, "treesitter")

	use_treesitter("nvim-treesitter/nvim-treesitter")
	use_treesitter("nvim-treesitter/nvim-treesitter-context")

	-- }}}

	-- NAVIGATION {{{

	local use_telescope = build_group_use(use, "telescope")

	use_telescope("nvim-telescope/telescope.nvim")
	use_telescope({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	use({
		"ThePrimeagen/harpoon",
		config = use_config("harpoon"),
	})

	-- }}}

	-- GIT {{{

	use({
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", "<cmd>G<CR>", { silent = true })
			vim.keymap.set("n", "<leader>gf", "<cmd>diffget //2<CR>", { silent = true })
			vim.keymap.set("n", "<leader>gj", "<cmd>diffget //3<CR>", { silent = true })
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		config = use_config("gitsigns"),
	})

	use({
		"TimUntersberger/neogit",
		config = use_setup("neogit"),
		requires = "nvim-lua/plenary.nvim",
	})

	use({
		"akinsho/git-conflict.nvim",
		tag = "*",
		config = use_setup("git-conflict"),
	})

	use({
		"sindrets/diffview.nvim",
		config = use_setup("diffview"),
		requires = "nvim-lua/plenary.nvim",
	})

	use({
		"ThePrimeagen/git-worktree.nvim",
		config = use_setup("git-worktree"),
	})

	use({
		"pwntester/octo.nvim",
		config = use_setup("octo"),
	})

	-- }}}

	-- APPEARANCE {{{

	use({
		"kyazdani42/nvim-web-devicons",
		requires = "lambdalisue/glyph-palette.vim",
		config = use_config("icons"),
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = "nvim-web-devicons",
		config = use_config("lines"),
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		config = use_config("indent_blankline"),
	})

	use({
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require("notify")
		end,
	})

	-- use({
	-- 	"JASONews/glow-hover.nvim",
	-- 	config = use_config("glow_hover"),
	-- })

	-- use({
	-- 	"jmederosalvarado/gruvy.nvim",
	-- 	config = function()
	-- 		vim.cmd("colorscheme gruvy")
	-- 	end,
	-- })

	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			vim.g.catppuccin_flavour = "frappe"
			require("catppuccin").setup({
				transparent_background = false,
				term_colors = true,
				compile = {
					enabled = false,
					path = vim.fn.stdpath("cache") .. "/catppuccin",
				},
				dim_inactive = {
					enabled = false,
					shade = "dark",
					percentage = 0.15,
				},
				styles = {
					comments = { "italic" },
					conditionals = { "italic" },
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
				},
				integrations = {
					treesitter = true,
					treesitter_context = true,
					cmp = true,
					gitsigns = true,
					telescope = true,
					nvimtree = true,
					markdown = true,
					notify = true,
					neogit = true,
					lightspeed = true,
					lsp_trouble = true,
					indent_blankline = {
						enabled = true,
						colored_indent_levels = false,
					},
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { "italic" },
							hints = { "italic" },
							warnings = { "italic" },
							information = { "italic" },
						},
						underlines = {
							errors = { "underline" },
							hints = { "underline" },
							warnings = { "underline" },
							information = { "underline" },
						},
					},
				},
				color_overrides = {},
				highlight_overrides = {},
			})
			vim.cmd("colorscheme catppuccin")
		end,
	})

	use({
		"ellisonleao/gruvbox.nvim",
		config = function()
			require("gruvbox").setup({
				undercurl = true,
				underline = true,
				bold = true,
				italic = true,
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "", -- can be "hard", "soft" or empty string
				overrides = {},
			})
			-- vim.cmd("colorscheme gruvbox")
		end,
	})

	-- }}}

	-- MISC {{{

	use({
		"kyazdani42/nvim-tree.lua",
		config = use_config("tree"),
	})

	use({
		"numToStr/Comment.nvim",
		config = use_setup("Comment"),
	})

	use({
		"karb94/neoscroll.nvim",
		config = use_setup("neoscroll"),
	})

	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = use_config("todo_comments"),
	})

	use("norcalli/nvim-colorizer.lua")

	use("gpanders/editorconfig.nvim")
	use("tpope/vim-surround")
	use("tpope/vim-repeat")
	use("tpope/vim-eunuch")
	use("tpope/vim-unimpaired")
	use("tpope/vim-abolish")
	-- use("tpope/vim-sleuth")
	use("tpope/vim-obsession")
	use({
		"rmagatti/auto-session",
		setup = function()
			vim.o.sessionoptions = vim.o.sessionoptions .. ",winpos,terminal"
		end,
		config = function()
			require("auto-session").setup({
				log_level = "error",
				pre_save_cmds = { "tabdo NvimTreeClose" },
			})
		end,
	})
	use({
		"ggandor/lightspeed.nvim",
		config = use_config("lightspeed"),
	})
	use({
		"andymass/vim-matchup",
		setup = function()
			vim.g.matchup_matchparen_offscreen = {
				method = "popup",
			}
		end,
	})
	use("wellle/targets.vim")
	-- use({
	-- "iamcco/markdown-preview.nvim",
	-- run = "cd app && yarn install",
	-- })

	use({ "tomlion/vim-solidity" })

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
