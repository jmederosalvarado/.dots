-- use control instead of leader because of how important this is
vim.keymap.set("n", "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<CR>", { silent = true })
vim.keymap.set("n", "gh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", { silent = true })
vim.keymap.set("n", "<C-h>", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", { silent = true })

require("harpoon").setup({
	menu = {
		borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
	},
})
