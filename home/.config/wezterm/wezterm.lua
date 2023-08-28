local wezterm = require("wezterm")

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- colors {{{

config.color_scheme = "Catppuccin Frappe"

-- }}}

-- font {{{

config.font_size = 14.0
config.allow_square_glyphs_to_overflow_width = "Never"
config.font = wezterm.font_with_fallback({
	"Iosevka Term",
	"IosevkaTerm Nerd Font",
	-- "IosevkaTerm Nerd Font Mono",
})
-- config.font = wezterm.font("IosevkaTerm Nerd Font")

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

-- hyperlinks {{{

config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- open username/repository in github.com
table.insert(config.hyperlink_rules, {
	regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
	format = "https://www.github.com/$1/$3",
})

-- }}}

return config
