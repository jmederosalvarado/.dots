vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle <CR>", { silent = true })
vim.keymap.set("n", "-", require("nvim-tree").open_replacing_current_buffer, { silent = true })

require("nvim-tree").setup({
	ignore_ft_on_setup = { "dashboard" },
	filters = {
		dotfiles = false,
		custom = { "^.git$", "^node_modules$" },
	},
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = false,
	},
	diagnostics = {
		enable = false,
		show_on_dirs = true,
		icons = {
			hint = "",
			info = "",
			warning = " ",
			error = " ",
		},
	},
	git = {
		ignore = false,
	},
	actions = {
		open_file = {
			quit_on_open = true,
			window_picker = {
				exclude = {
					filetype = { "notify", "packer", "qf" },
					buftype = { "terminal" },
				},
			},
		},
	},
	renderer = {
		indent_markers = { enable = true },
		highlight_git = true,
		special_files = {},
		icons = {
			show = {
				file = true,
				folder = false,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				git = {
					ignored = "",
					unstaged = "!",
					staged = "+",
					unmerged = "",
					renamed = "»",
					untracked = "?",
					deleted = "✗",
				},
			},
		},
	},
})
