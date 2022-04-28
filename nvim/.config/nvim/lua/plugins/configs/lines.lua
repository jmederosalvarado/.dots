vim.keymap.set("n", "<leader>lr", ":LualineRenameTab ")

local lualine = require("lualine")

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

local diff = {
	"diff",
	-- symbols = { added = " ", modified = " ", removed = " " },
	symbols = { added = " ", modified = " ", removed = " " },
	diff_color = {
		added = "GitSignsAdd",
		modified = "GitSignsChange",
		removed = "GitSignsDelete",
	},
	cond = conditions.hide_in_width,
}

local mode = {
	"mode",
}

local filetype = {
	"filetype",
	cond = conditions.buffer_not_empty,
	icon_only = true,
	-- padding = { left = 1, right = 0 },
}

local filename = {
	"filename",
	cond = conditions.buffer_not_empty,
	path = 1,
	-- padding = { left = 1, right = 0 },
}

local location = {
	"location",
}

local branch = {
	"branch",
}

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	update_in_insert = true,
	sections = { "error", "warn", "info" },
	symbols = { error = " ", warn = " ", info = " " },
	-- symbols = { error = " ", warn = " ", info = " " },
	-- diagnostics_color = {
	-- 	color_error = "DiagnosticSignError",
	-- 	color_warn = "DiagnosticSignWarn",
	-- 	color_info = "DiagnosticSignInfo",
	-- },
}

local tabs = {
	"tabs",

	max_length = vim.o.columns / 3, -- Maximum width of tabs component.
	-- Note:
	-- It can also be a function that returns
	-- the value of `max_length` dynamically.

	mode = 2,
	-- 0: Shows tab_nr
	-- 1: Shows tab_name
	-- 2: Shows tab_nr + tab_name
}

-- lualine.setup(config)
lualine.setup({
	options = {
		theme = "gruvy",
		-- theme = "gruvbox",
		-- theme = "onedark-nvim",
		globalstatus = true,
		-- disabled_filetypes = { "NvimTree" },
		-- Disable sections and component separators
		component_separators = "",
		section_separators = "",
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { filetype, filename },
		lualine_c = { diagnostics },
		lualine_x = {},
		lualine_y = { diff, branch },
		lualine_z = { location },
	},
	inactive_sections = {
		lualine_a = { filetype, filename },
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
	tabline = {
		lualine_a = {},
		lualine_b = { tabs },
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	extensions = { "fugitive", "quickfix", "nvim-tree" },
})
