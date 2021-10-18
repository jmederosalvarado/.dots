vim.keymap.nnoremap({ "<leader>gs", "<cmd>Git<cr>" })
vim.keymap.nnoremap({ "<leader>gh", "<cmd>diffget //2<cr>" })
vim.keymap.nnoremap({ "<leader>gl", "<cmd>diffget //3<cr>" })

-- vim.keymap.nnoremap({ "<tab>", "gt" })
-- vim.keymap.nnoremap({ "<s-tab>", "gT" })
vim.keymap.nnoremap({ "<leader><tab>n", "<cmd>tabnew<cr>" })
vim.keymap.nnoremap({ "<leader><tab>c", "<cmd>tabclose<cr>" })
vim.keymap.nnoremap({ "<leader><tab>o", "<cmd>tabonly<cr>" })

vim.keymap.nnoremap({ "<leader>1", "1gt" })
vim.keymap.nnoremap({ "<leader>2", "2gt" })
vim.keymap.nnoremap({ "<leader>3", "3gt" })
vim.keymap.nnoremap({ "<leader>4", "4gt" })
vim.keymap.nnoremap({ "<leader>5", "5gt" })
vim.keymap.nnoremap({ "<leader>6", "6gt" })
vim.keymap.nnoremap({ "<leader>7", "7gt" })
vim.keymap.nnoremap({ "<leader>8", "8gt" })
vim.keymap.nnoremap({ "<leader>9", "9gt" })

-- yank without the cursor moving to the top of the block
vim.keymap.vmap({ "y", "y`]" })

-- Make the experience in the terminal more consistent
vim.keymap.tnoremap({ "<c-]>", "<c-\\><c-n>" })
vim.keymap.nnoremap({ "<leader>tt", "<cmd>te<CR>" })

vim.keymap.vnoremap({ "J", ":m '>+1<CR>gv=gv" })
vim.keymap.vnoremap({ "K", ":m '<-2<CR>gv=gv" })

vim.keymap.nnoremap({ "Y", "yg$" })
vim.keymap.nnoremap({ "n", "nzzzv" })
vim.keymap.nnoremap({ "N", "Nzzzv" })
vim.keymap.nnoremap({ "J", "mzJ`z" })

vim.keymap.nnoremap({ "<leader>d", '"_d' })
vim.keymap.vnoremap({ "<leader>d", '"_d' })
vim.keymap.xnoremap({ "<leader>p", '"_dP' })

vim.keymap.nnoremap({ "<leader>d", '"_c' })
vim.keymap.vnoremap({ "<leader>d", '"_c' })
vim.keymap.xnoremap({ "<leader>c", '"_c' })

vim.keymap.nnoremap({ "<leader>y", '"+y' })
vim.keymap.vnoremap({ "<leader>y", '"+y' })
vim.keymap.nnoremap({ "<leader>Y", 'gg"+yG' })
