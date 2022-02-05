local highlight = function(group, guifg, guibg, attr, guisp)
	local parts = { group }
	if guifg then
		table.insert(parts, "guifg=" .. guifg)
	end
	if guibg then
		table.insert(parts, "guibg=" .. guibg)
	end
	if attr then
		table.insert(parts, "gui=" .. attr)
	end
	if guisp then
		table.insert(parts, "guisp=" .. guisp)
	end

	-- nvim.ex.highlight(parts)
	vim.api.nvim_command("highlight " .. table.concat(parts, " "))
end

local p = require("core.colors")

-- Vim editor colors {{{

highlight("Normal", p.light2, p.dark0, nil, nil)
highlight("Bold", nil, nil, "bold", nil)
highlight("Debug", p.bright_red, nil, nil, nil)
highlight("Directory", p.bright_blue, nil, nil, nil)
highlight("Error", p.dark0, p.bright_red, nil, nil)
highlight("ErrorMsg", p.bright_red, p.dark0, nil, nil)
highlight("Exception", p.bright_red, nil, nil, nil)
highlight("FoldColumn", p.bright_aqua, p.dark1, nil, nil)
highlight("Folded", p.dark3, p.dark1, nil, nil)
highlight("IncSearch", p.dark1, p.bright_orange, "none", nil)
highlight("Italic", nil, nil, "none", nil)
highlight("Macro", p.bright_red, nil, nil, nil)
highlight("MatchParen", nil, p.dark3, nil, nil)
highlight("ModeMsg", p.bright_green, nil, nil, nil)
highlight("MoreMsg", p.bright_green, nil, nil, nil)
highlight("Question", p.bright_blue, nil, nil, nil)
highlight("Search", p.dark1, p.bright_yellow, nil, nil)
highlight("Substitute", p.dark1, p.bright_yellow, "none", nil)
highlight("SpecialKey", p.dark3, nil, nil, nil)
highlight("TooLong", p.bright_red, nil, nil, nil)
highlight("Underlined", p.bright_red, nil, nil, nil)
highlight("Visual", nil, p.dark2, nil, nil)
highlight("VisualNOS", p.bright_red, nil, nil, nil)
highlight("WarningMsg", p.bright_red, nil, nil, nil)
highlight("WildMenu", p.bright_red, p.bright_yellow, nil, nil)
highlight("Title", p.bright_blue, nil, "none", nil)
highlight("Conceal", p.bright_blue, p.dark0, nil, nil)
highlight("Cursor", p.dark0, p.light2, nil, nil)
highlight("NonText", p.dark3, nil, nil, nil)
highlight("LineNr", p.dark3, "NONE", nil, nil)
highlight("SignColumn", p.dark3, "NONE", nil, nil)
highlight("StatusLine", p.light3, "NONE", "none", nil)
highlight("StatusLineNC", p.dark3, "NONE", "none", nil)
highlight("VertSplit", p.dark2, "NONE", "none", nil)
highlight("ColorColumn", nil, p.dark1, "none", nil)
highlight("CursorColumn", nil, p.dark1, "none", nil)
highlight("CursorLine", nil, p.dark1, "none", nil)
highlight("CursorLineNr", p.light3, "NONE", nil, nil)
highlight("QuickFixLine", nil, p.dark1, "none", nil)
highlight("PMenu", p.light2, p.dark1, "none", nil)
highlight("PMenuSel", p.dark1, p.light2, nil, nil)
highlight("TabLine", p.dark3, p.dark1, "none", nil)
highlight("TabLineFill", p.dark3, p.dark1, "none", nil)
highlight("TabLineSel", p.bright_green, p.dark0, "none", nil)

-- For floating windows
highlight("FloatBorder", p.darker, p.darker)
highlight("NormalFloat", nil, p.darker)

-- }}}

-- Standard syntax highlighting {{{

highlight("Boolean", p.bright_orange, nil, nil, nil)
highlight("Character", p.bright_red, nil, nil, nil)
highlight("Comment", p.gray, nil, "italic", nil)
highlight("Conditional", p.bright_purple, nil, nil, nil)
highlight("Constant", p.bright_orange, nil, nil, nil)
highlight("Define", p.bright_purple, nil, "none", nil)
highlight("Delimiter", p.light3, nil, nil, nil)
highlight("Float", p.bright_orange, nil, nil, nil)
highlight("Function", p.bright_blue, nil, nil, nil)
highlight("Identifier", p.bright_red, nil, "none", nil)
highlight("Include", p.bright_blue, nil, nil, nil)
highlight("Keyword", p.bright_purple, nil, nil, nil)
highlight("Label", p.bright_yellow, nil, nil, nil)
highlight("Number", p.bright_orange, nil, nil, nil)
highlight("Operator", p.light2, nil, "none", nil)
highlight("PreProc", p.bright_yellow, nil, nil, nil)
highlight("Repeat", p.bright_yellow, nil, nil, nil)
highlight("Special", p.bright_aqua, nil, nil, nil)
highlight("SpecialChar", p.bright_red, nil, nil, nil)
highlight("Statement", p.bright_red, nil, nil, nil)
highlight("StorageClass", p.bright_yellow, nil, nil, nil)
highlight("String", p.bright_green, nil, nil, nil)
highlight("Structure", p.bright_purple, nil, nil, nil)
highlight("Tag", p.bright_yellow, nil, nil, nil)
highlight("Todo", p.bright_yellow, p.dark1, nil, nil)
highlight("Type", p.bright_yellow, nil, "none", nil)
highlight("Typedef", p.bright_yellow, nil, nil, nil)

-- }}}

-- Diagnostics {{{

highlight("DiagnosticError", p.bright_red)
highlight("DiagnosticNumError", p.darker, p.bright_red)
highlight("DiagnosticSignError", p.bright_red)
highlight("DiagnosticUnderlineError", p.bright_red, nil, "undercurl")
highlight("DiagnosticFloatingError", p.bright_red)
highlight("DiagnosticVirtualTextError", p.bright_red)

highlight("DiagnosticWarn", p.bright_yellow)
highlight("DiagnosticNumWarn", p.darker, p.bright_yellow)
highlight("DiagnosticSignWarn", p.bright_yellow)
highlight("DiagnosticUnderlineWarn", p.bright_yellow, nil, "undercurl")
highlight("DiagnosticFloatingWarn", p.bright_yellow)
highlight("DiagnosticVirtualTextWarn", p.bright_yellow)

highlight("DiagnosticInfo", p.bright_blue)
highlight("DiagnosticNumbInfo", p.darker, p.bright_blue)
highlight("DiagnosticSignInfo", p.bright_blue)
highlight("DiagnosticUnderlineInfo", p.bright_blue, nil, "undercurl")
highlight("DiagnosticFloatingInfo", p.bright_blue)
highlight("DiagnosticVirtualTextInfo", p.bright_blue)

highlight("DiagnosticHint", p.bright_aqua)
highlight("DiagnosticNumHint", p.darker, p.bright_aqua)
highlight("DiagnosticSignHint", p.bright_aqua)
highlight("DiagnosticUnderlineHint", p.bright_aqua, nil, "undercurl")
highlight("DiagnosticFloatingHint", p.bright_aqua)
highlight("DiagnosticVirtualTextHint", p.bright_aqua)

-- }}}

-- Diff highlighting {{{

highlight("DiffAdd", p.bright_green, p.dark1, nil, nil)
highlight("DiffChange", p.dark3, p.dark1, nil, nil)
highlight("DiffDelete", p.bright_red, p.dark1, nil, nil)
highlight("DiffText", p.bright_blue, p.dark1, nil, nil)
highlight("DiffAdded", p.bright_green, p.dark0, nil, nil)
highlight("DiffFile", p.bright_red, p.dark0, nil, nil)
highlight("DiffNewFile", p.bright_green, p.dark0, nil, nil)
highlight("DiffLine", p.bright_blue, p.dark0, nil, nil)
highlight("DiffRemoved", p.bright_red, p.dark0, nil, nil)

-- }}}

-- Git highlighting {{{

highlight("gitcommitOverflow", p.bright_red, nil, nil, nil)
highlight("gitcommitSummary", p.bright_green, nil, nil, nil)
highlight("gitcommitComment", p.dark3, nil, nil, nil)
highlight("gitcommitUntracked", p.dark3, nil, nil, nil)
highlight("gitcommitDiscarded", p.dark3, nil, nil, nil)
highlight("gitcommitSelected", p.dark3, nil, nil, nil)
highlight("gitcommitHeader", p.bright_purple, nil, nil, nil)
highlight("gitcommitSelectedType", p.bright_blue, nil, nil, nil)
highlight("gitcommitUnmergedType", p.bright_blue, nil, nil, nil)
highlight("gitcommitDiscardedType", p.bright_blue, nil, nil, nil)
highlight("gitcommitBranch", p.bright_orange, nil, "bold", nil)
highlight("gitcommitUntrackedFile", p.bright_yellow, nil, nil, nil)
highlight("gitcommitUnmergedFile", p.bright_red, nil, "bold", nil)
highlight("gitcommitDiscardedFile", p.bright_red, nil, "bold", nil)
highlight("gitcommitSelectedFile", p.bright_green, nil, "bold", nil)

-- }}}

-- Spelling highlighting {{{

highlight("SpellBad", nil, nil, "undercurl", p.bright_red)
highlight("SpellLocal", nil, nil, "undercurl", p.bright_aqua)
highlight("SpellCap", nil, nil, "undercurl", p.bright_blue)
highlight("SpellRare", nil, nil, "undercurl", p.bright_purple)

-- }}}

-- Plugins {{{

-- Cmp {{{

highlight("CmpItemAbbr", p.light2) -- The abbr field's highlight group.
highlight("CmpItemAbbrDeprecated", nil, nil, "strikethrough", p.gray) -- The abbr field's highlight group that only used for deprecated item.
highlight("CmpItemAbbrMatch", p.bright_aqua) -- The matched character's highlight group.
highlight("CmpItemAbbrMatchFuzzy", p.bright_aqua) -- The fuzzy matched character's highlight group.
highlight("CmpItemKind", p.bright_orange) -- The kind field's highlight group.
highlight("CmpItemMenu", p.gray, nil) -- The menu field's highlight group.

-- }}}

-- Gitsigns {{{

highlight("GitSignsAdd", p.bright_green)
highlight("GitSignsChange", p.bright_aqua)
highlight("GitSignsDelete", p.bright_red)
highlight("GitSignsCurrentLineBlame", p.dark3, nil, "bold")

-- }}}

-- NvimTree {{{

highlight("NvimTreeEmptyFolderName", p.bright_blue)
highlight("NvimTreeFolderIcon", p.bright_blue)
highlight("NvimTreeFolderName", p.bright_blue)
highlight("NvimTreeGitDirty", p.neutral_orange)
highlight("NvimTreeIndentMarker", p.dark1, "NONE")
highlight("NvimTreeNormal", nil, p.darker)
highlight("NvimTreeNormalNC", nil, p.darker)
highlight("NvimTreeOpenedFolderName", p.neutral_blue)
highlight("NvimTreeRootFolder", p.bright_blue, p.darker, "bold")
highlight("NvimTreeStatuslineNc", p.darker, p.darker)
highlight("NvimTreeStatusline", p.darker, p.darker)
highlight("NvimTreeVertSplit", p.darker, p.darker)
highlight("NvimTreeWindowPicker", p.bright_red, p.dark2)

-- }}}

-- Bufferline {{{

highlight("BufferlineNvimTreeOffset", p.darker, p.bright_blue, "bold")

-- }}}

-- Telescope {{{

highlight("TelescopeBorder", p.darker, p.darker)
highlight("TelescopePromptBorder", p.dark1, p.dark1)

highlight("TelescopePromptNormal", p.light0, p.dark1)
highlight("TelescopePromptPrefix", p.bright_red)

highlight("TelescopeNormal", nil, p.darker)

highlight("TelescopePreviewTitle", p.darker, p.bright_green)
highlight("TelescopePromptTitle", p.darker, p.bright_red)
highlight("TelescopeResultsTitle", p.darker, p.bright_blue)

highlight("TelescopeSelection", nil, p.dark3)

-- }}}

-- Harpoon {{{

highlight("HarpoonBorder", nil, p.darker)
highlight("HarpoonWindow", nil, p.darker)

-- }}}

-- Lualine {{{

highlight("LualineModeNORMAL", p.bright_red, p.dark2)
highlight("LualineModeINSERT", p.bright_green, p.dark2)
highlight("LualineModeVISUAL", p.bright_aqua, p.dark2)
highlight("LualineModeSELECT", p.bright_blue, p.dark2)
highlight("LualineModeREPLACE", p.bright_orange, p.dark2)
highlight("LualineModeCOMMAND", p.bright_purple, p.dark2)
highlight("LualineModeSHELL", p.bright_green, p.dark2)
highlight("LualineModeTERMINAL", p.bright_green, p.dark2)
highlight("LualineModeMORE", p.bright_aqua, p.dark2)

-- }}}

-- IndentBlankline {{{

highlight("IndentBlanklineContextChar", p.light2, nil)

-- }}}

-- }}}
