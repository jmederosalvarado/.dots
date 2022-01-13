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
        indentLine_enabled = 1,
        char = "┊", -- ▏┆ ┊
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
        buftype_exclude = { "terminal" },
        show_trailing_blankline_indent = false,
    })
end

return function(config)
	local config_fn = config_fns[config]
	if type(config_fn) == "function" then
		return config_fn()
	end

	return require("plugins.configs." .. config)
end
