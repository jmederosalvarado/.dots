vim.cmd([[command! H Telescope help_tags]])
vim.cmd([[command! Help Telescope help_tags]])

vim.keymap.set("n", "<leader>fa", ":Telescope <CR>", { silent = true })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers <CR>", { silent = true })
vim.keymap.set("n", "<leader>ff", ":Telescope find_files no_ignore=true <CR>", { silent = true })
vim.keymap.set("n", "<leader>fh", ":Telescope find_files hidden=true <CR>", { silent = true })
vim.keymap.set("n", "<leader>fgc", ":Telescope git_commits <CR>", { silent = true })
vim.keymap.set("n", "<leader>fgs", ":Telescope git_status <CR>", { silent = true })
vim.keymap.set("n", "<leader>fw", ":Telescope live_grep <CR>", { silent = true })
vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles <CR>", { silent = true })

vim.keymap.set(
	"n",
	"<leader>wt",
	":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
	{ silent = true }
)
vim.keymap.set(
	"n",
	"<leader>nwt",
	":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
	{ silent = true }
)

local telescope = require("telescope")

telescope.setup({
	defaults = {
		prompt_prefix = "   ",
		selection_caret = "❯ ",
	},
})

telescope.load_extension("fzf")
telescope.load_extension("git_worktree")
