vim.keymap.set({ "v", "n" }, "<leader>y", '"+y', { silent = true })
vim.keymap.set("n", "<leader>Y", 'gg"+yG', { silent = true })

vim.keymap.set({ "v", "n" }, "<leader>d", '"_d', { silent = true })
vim.keymap.set({ "x" }, "p", "P", { silent = true })

vim.keymap.set("n", "<leader>1", "1gt", { silent = true })
vim.keymap.set("n", "<leader>2", "2gt", { silent = true })
vim.keymap.set("n", "<leader>3", "3gt", { silent = true })
vim.keymap.set("n", "<leader>4", "4gt", { silent = true })
vim.keymap.set("n", "<leader>5", "5gt", { silent = true })
vim.keymap.set("n", "<leader>6", "6gt", { silent = true })
vim.keymap.set("n", "<leader>7", "7gt", { silent = true })
vim.keymap.set("n", "<leader>8", "8gt", { silent = true })
vim.keymap.set("n", "<leader>9", "9gt", { silent = true })

if vim.g.vscode then
	vim.keymap.set({ "x", "o", "n" }, "gc", "<Plug>VSCodeCommentary")
	vim.keymap.set({ "x", "o", "n" }, "gcc", "<Plug>VSCodeCommentaryLine")

	-- vim.keymap.set("n", "<C-e>", "<Cmd>call VSCodeNotify('workbench.view.explorer')<CR>")
	-- vim.keymap.set("n", "<leader>t", "<Cmd>call VSCodeNotify('workbench.action.terminal.toggleTerminal')<CR>")
end
