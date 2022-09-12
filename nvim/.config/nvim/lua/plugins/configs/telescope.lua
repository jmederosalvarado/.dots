vim.cmd([[command! H Telescope help_tags]])
vim.cmd([[command! Help Telescope help_tags]])

vim.keymap.set("n", "<leader>f", ":Telescope<CR>", { silent = true })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { silent = true })
vim.keymap.set("n", "<leader>fh", ":Telescope find_files hidden=true<CR>", { silent = true })
vim.keymap.set("n", "<leader>fgc", ":Telescope git_commits<CR>", { silent = true })
vim.keymap.set("n", "<leader>fgs", ":Telescope git_status<CR>", { silent = true })
vim.keymap.set("n", "<leader>fw", ":Telescope live_grep<CR>", { silent = true })
vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<CR>", { silent = true })

-- create mapping for telescope find_files using lua
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { silent = true })

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

vim.api.nvim_create_user_command("LiveGrep", function(opts)
	vim.notify(vim.inspect(opts))
	require("telescope.builtin").live_grep({ glob_pattern = opts.args })
end, { nargs = 1 })

local telescope = require("telescope")

telescope.setup({
	defaults = {
		prompt_prefix = "   ",
		selection_caret = "❯ ",
	},
})

telescope.load_extension("fzf")
telescope.load_extension("git_worktree")
