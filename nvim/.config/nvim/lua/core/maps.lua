vim.keymap.set("x", "<leader>p", '"_dP', { silent = true })

vim.keymap.set({ "v", "n" }, "<leader>y", '"+y', { silent = true })
vim.keymap.set("n", "<leader>Y", 'gg"+yG', { silent = true })

vim.keymap.set({ "v", "n" }, "<leader>d", '"_d', { silent = true })

if vim.g.vscode then
	vim.keymap.set({ "x", "o", "n" }, "gc", "<Plug>VSCodeCommentary")
	vim.keymap.set({ "x", "o", "n" }, "gcc", "<Plug>VSCodeCommentaryLine")

	-- vim.keymap.set("n", "<leader>t", "<Cmd>call VSCodeNotify('workbench.view.explorer')<CR>")
end
