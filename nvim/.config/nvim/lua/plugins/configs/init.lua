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

config_fns.icons = function ()
    require("nvim-web-devicons").setup({ default = true })
end

config_fns.gitsigns = function ()
    require("gitsigns").setup({
        preview_config = {
            border = 'solid',
        },
        current_line_blame = true,
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local map = function (mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
            map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

            -- Actions
            map({'n', 'v'}, '<leader>hs', gs.stage_hunk)
            map({'n', 'v'}, '<leader>hr', gs.reset_hunk)
            map('n', '<leader>hS', gs.stage_buffer)
            map('n', '<leader>hp', gs.preview_hunk)
            map('n', '<leader>hu', gs.undo_stage_hunk)
            map('n', '<leader>hb', function() gs.blame_line{full=true} end)
            map('n', '<leader>hd', gs.diffthis)
            map('n', '<leader>hD', function() gs.diffthis('~') end)
            map('n', '<leader>td', gs.toggle_deleted)
        end
    })
end

return function(config)
	local config_fn = config_fns[config]
	if type(config_fn) == "function" then
		return config_fn()
	end

	return require("plugins.configs." .. config)
end
