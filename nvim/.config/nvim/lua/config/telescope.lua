local nnoremap = vim.keymap.nnoremap

require("telescope").setup({
	defaults = {
		prompt_prefix = "# ",
		selection_caret = "❯ ",
	},
})

nnoremap({ "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>" })
nnoremap({ "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>" })
nnoremap({ "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>" })

nnoremap({ "<leader>fq", "<cmd>lua require('telescope.builtin').quickfix()<cr>" })
nnoremap({ "<leader>fl", "<cmd>lua require('telescope.builtin').loclist()<cr>" })

vim.cmd("command! TeleMan lua require('telescope.builtin').man_pages()")
vim.cmd("command! TeleHelp lua require('telescope.builtin').help_tags()")
