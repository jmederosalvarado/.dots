vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle <CR>", { silent = true })
vim.keymap.set("n", "-", require("nvim-tree").open_replacing_current_buffer, { silent = true })

vim.g.nvim_tree_git_hl = true
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_special_files = {}

vim.g.nvim_tree_icons = {
	default = "",
	symlink = "",
	git = {
		ignored = "",
		unstaged = "!",
		staged = "+",
		unmerged = "",
		renamed = "»",
		untracked = "?",
		deleted = "✗",
	},
	folder = {
		default = "",
		empty = "",
		symlink = "",

		open = "",
		empty_open = "",
		symlink_open = "",
	},
}

require("nvim-tree").setup({
	ignore_ft_on_setup = { "dashboard" },
	filters = {
		dotfiles = false,
		custom = { ".git", "node_modules" },
	},
	auto_close = false,
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
	},
})
