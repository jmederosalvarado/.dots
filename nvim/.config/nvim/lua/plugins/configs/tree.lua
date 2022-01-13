vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle <CR>", { silent = true })
vim.keymap.set("n", "-", "<cmd>NvimTreeFindFile <CR>", { silent = true })

vim.g.nvim_tree_git_hl = true
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_quit_on_open = 1 -- closes tree when file's opened
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_special_files = {}

vim.g.nvim_tree_window_picker_exclude = {
	filetype = { "notify", "packer", "qf" },
	buftype = { "terminal" },
}

vim.g.nvim_tree_show_icons = {
	folders_arrows = 1,
	folders = 1,
	files = 1,
	git = 0,
}

require("nvim-tree").setup({
	ignore_ft_on_setup = { "dashboard" },
	filters = {
		dotfiles = false,
		custom = { ".git", "node_modules" },
	},
	auto_close = false,
	open_on_tab = false,
	hijack_cursor = true,
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = false,
	},
	git = {
		ignore = false,
	},
})
