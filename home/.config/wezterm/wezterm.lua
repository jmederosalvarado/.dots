local wezterm = require("wezterm")

return {
	color_scheme = "Catppuccin Frappe",
	-- color_scheme = "Gruvbox Dark",
	allow_square_glyphs_to_overflow_width = "Never",
	font = wezterm.font_with_fallback({
		"Iosevka Term",
		-- "nonicons",
		-- "Symbols Nerd Font Mono",
		"Iosevka Nerd Font Mono",
	}),
	font_size = 14.0,
	enable_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
}
