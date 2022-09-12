local cmp = require("cmp")
local types = require("cmp.types")
local luasnip = require("luasnip")

local icons = {
	Text = " ",
	Method = " ",
	Function = " ",
	Constructor = " ",
	Field = "ﰠ",
	Variable = " ",
	Class = "ﴯ",
	Interface = " ",
	Module = " ",
	Property = "ﰠ",
	Unit = "塞",
	Value = " ",
	Enum = " ",
	Keyword = " ",
	Snippet = " ",
	Color = " ",
	File = " ",
	Reference = " ",
	Folder = " ",
	EnumMember = " ",
	Constant = " ",
	Struct = "פּ",
	Event = " ",
	Operator = " ",
	TypeParameter = "",
}

vim.opt.completeopt = "menuone,noselect"

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)

			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				luasnip = "[SNIP]",
				nvim_lua = "[LUA]",
				buffer = "[BUF]",
				path = "[PATH]",
			})[entry.source.name]

			return vim_item
		end,
	},
	mapping = {
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),

		["<C-n>"] = cmp.mapping(
			cmp.mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Insert }),
			{ "i", "c" }
		),
		["<C-p>"] = cmp.mapping(
			cmp.mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Insert }),
			{ "i", "c" }
		),
		["<C-y>"] = cmp.mapping(
			cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
			{ "i", "c" }
		),

		["<C-e>"] = cmp.mapping(cmp.mapping.abort(), { "i", "c" }),
		["<C-c>"] = cmp.mapping(cmp.mapping.close(), { "i", "c" }),

		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),

		-- ["<Tab>"] = cmp.mapping(function(fallback)
		-- 	if luasnip.expand_or_locally_jumpable() and luasnip.jumpable(1) then
		-- 		luasnip.jump(1)
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, { "i", "s" }),
		--
		-- ["<S-Tab>"] = cmp.mapping(function(fallback)
		-- 	if luasnip.jumpable(-1) then
		-- 		luasnip.jump(-1)
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, { "i", "s" }),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "git" },
		{ name = "luasnip" },
		{ name = "buffer", max_item_count = 5 },
		-- { name = "nvim_lua" }, -- use lua lsp instead
		{ name = "path" },
	},
	experimental = {
		ghost_text = true,
	},
})

-- Set configuration for gitcommit
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" },
	}, {
		{ name = "buffer" },
	}),
})

-- cmp.setup.cmdline("/", {
-- 	sources = {
-- 		{ name = "buffer" },
-- 	},
-- })
--
-- cmp.setup.cmdline("?", {
-- 	sources = {
-- 		{ name = "buffer" },
-- 	},
-- })
--
-- cmp.setup.cmdline(":", {
-- 	sources = {
-- 		{ name = "path" },
-- 		{ name = "cmdline" },
-- 	},
-- })

require("nvim-autopairs").setup({ check_ts = true })
cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done({ map_char = { tex = "" } }))

require("luasnip.loaders.from_vscode").load()
