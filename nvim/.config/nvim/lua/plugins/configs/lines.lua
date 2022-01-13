local lualine = require("lualine")

-- Color table for highlights
local colors = require("core.colors")

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

-- Config
local config = {
	options = {
		disabled_filetypes = { "NvimTree" },
		-- Disable sections and component separators
		component_separators = "",
		section_separators = "",
		theme = {
			-- We are going to use lualine_c an lualine_x as left and
			-- right section. Both are highlighted by c theme .  So we
			-- are just setting default looks o statusline
			normal = { c = { fg = colors.light2 } },
			inactive = { c = { fg = colors.dark3 } },
		},
	},
	sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		-- These will be filled later
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
	  -- these are to remove the defaults
	  lualine_a = {},
	  lualine_b = {},
	  lualine_y = {},
	  lualine_z = {},
	  lualine_c = {},
	  lualine_x = {},
	},
    extensions = { "fugitive" }
}

-- Inserts a component in lualine_c at left section
local function ins_left(component, inactive)
    if inactive then
        table.insert(config.inactive_sections.lualine_c, component)
    else
        table.insert(config.sections.lualine_c, component)
    end
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component, inactive)
    if inactive then
        table.insert(config.inactive_sections.lualine_x, component)
    else
        table.insert(config.sections.lualine_x, component)
    end
end

local delimiter_left = {
	function()
		return "▊"
	end,
	color = { fg = colors.light2, bg = colors.dark2 }, -- Sets highlighting of component
	padding = { left = 0, right = 0 }, -- We don't need space before this
}

local mode = {
	-- mode component
	function()
		-- auto change color according to neovims mode
		local mode = ({
			["n"] = { "NORMAL", "NORMAL" },
			["no"] = { "N-PENDING", "NORMAL" },

			["i"] = { "INSERT", "INSERT" },
			["ic"] = { "INSERT", "INSERT" },

			["v"] = { "VISUAL", "VISUAL" },
			["V"] = { "V-LINE", "VISUAL" },
			[""] = { "V-BLOCK", "VBLOCK" },

			["s"] = { "SELECT", "SELECT" },
			["S"] = { "S-LINE", "SELECT" },
			[""] = { "S-BLOCK", "SELECT" },

			["R"] = { "REPLACE", "REPLACE" },
			["Rv"] = { "V-REPLACE", "REPLACE" },

			["c"] = { "COMMAND", "COMMAND" },
			["cv"] = { "COMMAND", "COMMAND" },
			["ce"] = { "COMMAND", "COMMAND" },

			["!"] = { "SHELL", "SHELL" },
			["t"] = { "TERMINAL", "TERMINAL" },
			["r"] = { "PROMPT", "MORE" },
			["rm"] = { "MORE", "MORE" },
			["r?"] = { "CONFIRM", "MORE" },
		})[vim.fn.mode()]
		vim.cmd("hi! link LualineMode LualineMode" .. mode[2])
		return mode[1]
	end,
	color = "LualineMode",
}

local filetype = {
	"filetype",
	cond = conditions.buffer_not_empty,
	icon_only = true,
	padding = { left = 1, right = 0 },
}
local filename = {
	"filename",
	cond = conditions.buffer_not_empty,
	color = "LualineFileName",
	path = 1,
	padding = { left = 1, right = 0 },
}
local location = { "location", color = "LualineLocation", padding = { left = 1, right = 0 } }
local progress = { "progress", color = "LualineProgress", padding = { left = 1, right = 1 } }

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	update_in_insert = true,
	sections = { "error", "warn", "info" },
	symbols = { error = " ", warn = " ", info = " " },
	diagnostics_color = {
		color_error = "DiagnosticSignError",
		color_warn = "DiagnosticSignWarn",
		color_info = "DiagnosticSignInfo",
	},
}

-- Add components to right sections
local format = {
	"fileformat",
}

local encoding = {
	"encoding",
	fmt = string.upper, -- I'm not sure why it's upper case either ;)
	cond = conditions.hide_in_width,
	color = "LualineEncoding",
}

local branch = {
	"branch",
	icon = "",
	color = { fg = colors.bright_purple, gui = "bold" },
}

local diff = {
	"diff",
	symbols = { added = " ", modified = " ", removed = " " },
	diff_color = {
		added = "GitSignsAdd",
		modified = "GitSignsChange",
		removed = "GitSignsDelete",
	},
	cond = conditions.hide_in_width,
}

local delimiter_right = {
	function()
		return "▊"
	end,
	color = "LualineDelimiter",
	padding = { left = 1 },
}

ins_left(delimiter_left)
ins_left(mode)
ins_left(filetype)
ins_left(filename)
ins_left(location)
ins_left(progress)
ins_left(diagnostics)

-- ins_right(format)
-- ins_right(encoding)
ins_right(branch)
ins_right(diff)
ins_right(delimiter_right)

ins_left({ "filename", path = 1 }, true)

lualine.setup(config)
