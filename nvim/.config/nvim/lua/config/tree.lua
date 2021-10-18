vim.g.nvim_tree_width = 50
-- vim.g.nvim_tree_follow = 1
-- vim.g.nvim_tree_lsp_diagnostics = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_ignore = { ".git", "node_modules" }

vim.g.nvim_tree_special_files = {}
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_show_icons = {
	git = 0,
	files = 1,
	folders = 1,
	folder_arrows = 0,
}
vim.g.nvim_tree_icons = {
	default = "",
	symlink = "",
	git = {
		unstaged = "!",
		staged = "+",
		unmerged = "",
		renamed = "»",
		untracked = "?",
		deleted = "✗",
		-- ignored = "◌",
	},
	folder = {
		arrow_open = "",
		arrow_closed = "",
		default = "",
		open = "",
		empty = "",
		empty_open = "",
		symlink = "",
		symlink_open = "",
	},
	lsp = {
		hint = "",
		info = "",
		warning = "",
		error = "",
	},
}

local tree = require("nvim-tree")

local tree_width = 30

tree.setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = {},
	auto_close = false,
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = true,
	update_focused_file = {
		enable = false,
		update_cwd = false,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	view = {
		width = tree_width,
	},
})

vim.cmd("nnoremap <silent> <C-n> :NvimTreeToggle<CR>")
vim.cmd("nnoremap <silent> - :NvimTreeFindFile<CR>")
