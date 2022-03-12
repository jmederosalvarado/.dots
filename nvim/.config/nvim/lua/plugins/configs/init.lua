local config_fns = {}

config_fns.lsp_signature = function()
	require("lsp_signature").setup({
		floating_window = true,
		fix_pos = true,
		hint_enable = true,
		hint_prefix = " ",

		hi_parameter = "Search",
		handler_opts = { border = "solid" },
		toggle_key = "<C-s>",
	})
end

config_fns.indent_blankline = function()
	require("indent_blankline").setup({
		char = "┊", -- ▏┊
		context_char = "┊", -- ▏┊
		filetype_exclude = {
			"help",
			"terminal",
			"dashboard",
			"packer",
			"lspinfo",
			"lsp-installer",
			"TelescopePrompt",
			"TelescopeResults",
		},
		show_current_context = true,
		buftype_exclude = { "terminal" },
		show_trailing_blankline_indent = false,
	})
end

config_fns.todo_comments = function()
	require("todo-comments").setup({
		signs = false,
		highlight = {
			before = "",
			keyword = "bg",
			after = "",
		},
	})
end

config_fns.icons = function()
	require("nvim-web-devicons").setup({ default = true })
end

config_fns.conflict_marker_setup = function()
	vim.cmd([[
    " disable the default highlight group
    " let g:conflict_marker_highlight_group = 'ConflictMarker'
    let g:conflict_marker_highlight_group = ''

    " disable default mappings
    let g:conflict_marker_enable_mappings = 0

    " Include text after begin and end markers
    let g:conflict_marker_begin = '^<<<<<<< .*$'
    let g:conflict_marker_end   = '^>>>>>>> .*$'
    ]])
end

config_fns.conflict_marker_config = function()
	vim.keymap.set({ "n" }, "<leader>ho", ":ConflictMarkerOurs<CR>", { silent = true })
	vim.keymap.set({ "n" }, "<leader>ht", ":ConflictMarkerThemselves<CR>", { silent = true })
	vim.keymap.set({ "n" }, "<leader>hb", ":ConflictMarkerBoth<CR>", { silent = true })
	vim.keymap.set({ "n" }, "]x", ":ConflictMarkerNextHunk<CR>", { silent = true })
	vim.keymap.set({ "n" }, "[x", ":ConflictMarkerPrevHunk<CR>", { silent = true })
end

config_fns.gitsigns = function()
	require("gitsigns").setup({
		preview_config = {
			border = "solid",
		},
		current_line_blame = true,
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local map = function(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
			map("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

			-- Actions
			map({ "n", "v" }, "<leader>hs", gs.stage_hunk)
			map({ "n", "v" }, "<leader>hr", gs.reset_hunk)
			map("n", "<leader>hS", gs.stage_buffer)
			map("n", "<leader>hp", gs.preview_hunk)
			map("n", "<leader>hu", gs.undo_stage_hunk)
			-- map('n', '<leader>hb', function() gs.blame_line{full=true} end)
			map("n", "<leader>hd", gs.diffthis)
			map("n", "<leader>hD", function()
				gs.diffthis("~")
			end)
			map("n", "<leader>td", gs.toggle_deleted)
		end,
	})
end

config_fns.jupyter = function() end

config_fns.tokyonight = function() end
config_fns.onedark = function()
	require("onedark").setup({
		-- Main options --
		style = "darker", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
		transparent = false, -- Show/hide background
		term_colors = true, -- Change terminal color as per the selected theme style
		ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
		-- toggle theme style ---
		toggle_style_key = "<leader>ts", -- Default keybinding to toggle
		toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

		-- Change code style ---
		-- Options are italic, bold, underline, none
		-- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
		code_style = {
			comments = "italic",
			keywords = "none",
			functions = "none",
			strings = "none",
			variables = "none",
		},

		-- Custom Highlights --
		colors = {}, -- Override default colors
		highlights = {}, -- Override highlight groups

		-- Plugins Config --
		diagnostics = {
			darker = true, -- darker colors for diagnostic
			undercurl = true, -- use undercurl instead of underline for diagnostics
			background = true, -- use background color for virtual text
		},
	})
end

config_fns.lightspeed = function()
	require("lightspeed").setup({
		-- ignore_case = true,
	})
end

return function(config)
	local config_fn = config_fns[config]
	if type(config_fn) == "function" then
		return config_fn()
	end

	return require("plugins.configs." .. config)
end
