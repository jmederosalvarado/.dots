require("nvim-treesitter.configs").setup({
	highlight = { enable = true },
	incremental_selection = { enable = false },
	indent = { enable = true, disable = { "python", "yaml" } },
	autopairs = { enable = true },
	autotag = { enable = true },
	matchup = { enable = true },
})

-- vim.cmd([[
--   set foldmethod=expr
--   set foldexpr=nvim_treesitter#foldexpr()
-- ]])
