vim.g.coq_settings = {
	["auto_start"] = "shut-up",
	["keymap.recommended"] = false,
	["display.ghost_text.enabled"] = false,
	["display.preview.border"] = {
		{ "", "NormalFloat" },
		{ "", "NormalFloat" },
		{ "", "NormalFloat" },
		{ " ", "NormalFloat" },
		{ "", "NormalFloat" },
		{ "", "NormalFloat" },
		{ "", "NormalFloat" },
		{ " ", "NormalFloat" },
	},
	["display.pum.fast_close"] = false,
	["display.icons.mode"] = "none",
	["display.icons.mappings"] = {
		Boolean = "",
		Character = "",
		Class = "",
		Color = "",
		Constant = "",
		Constructor = "",
		Enum = "",
		EnumMember = "",
		Event = "",
		Field = "",
		File = "",
		Folder = "",
		Function = "ﬦ",
		Interface = "",
		Keyword = "",
		Method = "",
		Module = "",
		Number = "",
		Operator = "",
		Parameter = "",
		Property = "ﰠ",
		Reference = "",
		Snippet = "",
		String = "",
		Struct = "ﯟ",
		Text = "",
		TypeParameter = "",
		Unit = "",
		Value = "",
		Variable = "",
	},
	-- ["clients.tabnine.enabled"] = true,
}
local remap = vim.api.nvim_set_keymap
local npairs = require("nvim-autopairs")

npairs.setup({ map_bs = false })

-- these mappings are coq recommended mappings unrelated to nvim-autopairs
remap("i", "<esc>", [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
remap("i", "<c-c>", [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
remap("i", "<tab>", [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
remap("i", "<s-tab>", [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })

-- skip it, if you use another global object
_G.MUtils = {}

MUtils.CR = function()
	if vim.fn.pumvisible() ~= 0 then
		if vim.fn.complete_info({ "selected" }).selected ~= -1 then
			return npairs.esc("<c-y>")
		else
			return npairs.esc("<c-e>") .. npairs.autopairs_cr()
		end
	else
		return npairs.autopairs_cr()
	end
end
remap("i", "<cr>", "v:lua.MUtils.CR()", { expr = true, noremap = true })

MUtils.BS = function()
	if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ "mode" }).mode == "eval" then
		return npairs.esc("<c-e>") .. npairs.autopairs_bs()
	else
		return npairs.autopairs_bs()
	end
end
remap("i", "<bs>", "v:lua.MUtils.BS()", { expr = true, noremap = true })
