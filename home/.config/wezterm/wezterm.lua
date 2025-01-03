local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- shell integration {{{

config.set_environment_variables = {
	TERMINAL_APP = "WEZTERM",
}

-- }}}

-- colors {{{

local catpuccin = require("catpuccin.plugin")

catpuccin.apply_to_config(config, {
	flavor = "frappe",
	accent = "blue",
	sync = true,
	sync_flavors = { light = "latte", dark = "frappe" },
	color_overrides = {
		mocha = {},
		macchiato = {},
		frappe = {
			base = "#26262a",
			mantle = "#222226",
			crust = "#1E1E22",

			surface0 = "#363646",
			surface1 = "#464656",
			surface2 = "#5E5E6E",

			overlay0 = "#6E6E7E",
			overlay1 = "#808090",
			overlay2 = "#9393a3",

			subtext0 = "#A6A6b6",
			subtext1 = "#B9B9c9",

			text = "#D2D2e2",
		},
		latte = {},
	},
	token_overrides = { mocha = {}, macchiato = {}, frappe = {}, latte = {} },
})

-- }}}

-- font {{{

config.font_size = 15.0
config.allow_square_glyphs_to_overflow_width = "Always"

local iosevka = {
"Iosevka Term",
-- "Iosevka Term Curly",
-- "Iosevka Term Curly Slab",
-- "Iosevka Term SS08",
-- "Iosevka Term Slab",
	{ family = "IosevkaTerm Nerd Font Propo", scale = 0.70 },
	-- { family = "Symbols Nerd Font Mono", scale = 0.70 },
}

config.font = wezterm.font_with_fallback(iosevka)

-- }}}

-- tabs & windows {{{

config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- }}}

-- multiplexing {{{

-- }}}

-- keybindings {{{

local act = wezterm.action

config.disable_default_key_bindings = true
config.leader = { key = "a", mods = "CMD" }
config.keys = {
	{ key = "a", mods = "LEADER|CTRL", action = act.SendKey({ key = "a", mods = "CTRL" }) },

	-- misc
	{ key = "c", mods = "CMD", action = act.CopyTo("Clipboard") },
	{ key = "v", mods = "CMD", action = act.PasteFrom("Clipboard") },

	-- tab creation
	{ key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "n", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },

	-- pane creation
	{ key = "v", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "s", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

	-- tab navigation
	{ key = "1", mods = "CMD", action = act.ActivateTab(0) },
	{ key = "2", mods = "CMD", action = act.ActivateTab(1) },
	{ key = "3", mods = "CMD", action = act.ActivateTab(2) },
	{ key = "4", mods = "CMD", action = act.ActivateTab(3) },
	{ key = "5", mods = "CMD", action = act.ActivateTab(4) },
	{ key = "6", mods = "CMD", action = act.ActivateTab(5) },
	{ key = "7", mods = "CMD", action = act.ActivateTab(6) },
	{ key = "8", mods = "CMD", action = act.ActivateTab(7) },
	{ key = "9", mods = "CMD", action = act.ActivateTab(8) },

	-- pane navigation
	{ key = "h", mods = "CMD", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "CMD", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "CMD", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "CMD", action = act.ActivatePaneDirection("Right") },
}

-- }}}

-- hyperlinks {{{

config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- open username/repository in github.com
table.insert(config.hyperlink_rules, {
	regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
	format = "https://www.github.com/$1/$3",
})

-- }}}

return config
