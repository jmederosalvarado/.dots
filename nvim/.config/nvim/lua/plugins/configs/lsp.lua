local default_on_attach = function(client, bufnr)
	local map = function(lhs, rhs)
		vim.keymap.set("n", lhs, rhs, { buffer = bufnr, silent = true })
	end

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	map("gD", ":lua vim.lsp.buf.declaration()<CR>")
	map("gd", ":lua vim.lsp.buf.definition()<CR>")
	map("gi", ":lua vim.lsp.buf.implementation()<CR>")
	map("gr", ":lua vim.lsp.buf.references()<CR>")
	map("gT", ":lua vim.lsp.buf.type_definition()<CR>")

	map("K", ":lua vim.lsp.buf.hover()<CR>")
	-- map("<c-k>", ":lua vim.lsp.buf.signature_help()<CR>")

	map("<leader>wa", ":lua vim.lsp.buf.add_workspace_folder()<CR>")
	map("<leader>wr", ":lua vim.lsp.buf.remove_workspace_folder()<CR>")
	map("<leader>wl", ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")

	map("<leader>aa", ":lua vim.lsp.buf.code_action()<CR>")
	map("<leader>rn", ":lua vim.lsp.buf.rename()<CR>")

	map("[d", ":lua vim.diagnostic.goto_prev()<CR>")
	map("]d", ":lua vim.diagnostic.goto_next()<CR>")
	map("<leader>e", ":lua vim.diagnostic.open_float()<CR>")

	local disable_formatting = { "pyright", "sumneko_lua" }
	if vim.tbl_contains(disable_formatting, client.name) then
		client.resolved_capabilities.document_formatting = false
	end

	if client.resolved_capabilities.document_formatting then
		map("<leader>fm", ":lua vim.lsp.buf.formatting_sync()<CR>")
		vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
        ]])
	end
end

local server_setups = {}

-- Default {{{

server_setups["default"] = {
	on_attach = default_on_attach,
}

-- }}}

-- Lua {{{

server_setups["sumneko_lua"] = require("lua-dev").setup({
	lspconfig = {
		on_attach = default_on_attach,
	},
})

-- }}}

-- Rust {{{

server_setups["rust-analyzer"] = {
	on_attach = default_on_attach,
	settings = {
		["rust-analyzer.checkOnSave.command"] = "clippy",
	},
}

-- }}}

-- Typescript & Javascript {{{

server_setups["tsserver"] = {
	on_attach = function(client, bufnr)
		default_on_attach(client, bufnr)

		local ts_utils = require("nvim-lsp-ts-utils")

		-- defaults
		ts_utils.setup({
			debug = false,
			disable_commands = false,
			enable_import_on_completion = true,

			-- import all
			import_all_timeout = 5000, -- ms
			import_all_priorities = {
				buffers = 4, -- loaded buffer names
				buffer_content = 3, -- loaded buffer content
				local_files = 2, -- git files or files with relative path markers
				same_file = 1, -- add to existing import statement
			},
			import_all_scan_buffers = 100,
			import_all_select_source = false,

			-- eslint
			eslint_enable_code_actions = true,
			eslint_enable_disable_comments = true,
			eslint_bin = "eslint_d",
			eslint_config_fallback = nil,
			eslint_enable_diagnostics = true,
			eslint_show_rule_id = false,

			-- formatting
			enable_formatting = true,
			formatter = "prettierd",
			formatter_config_fallback = nil,

			-- update imports on file move
			update_imports_on_move = false,
			require_confirmation_on_move = true,
			watch_dir = nil,
		})

		client.resolved_capabilities.document_formatting = false
		-- required to fix code action ranges
		ts_utils.setup_client(client)
	end,
}

-- }}}

-- Null {{{

local nls = require("null-ls")
nls.setup({
	sources = {
		nls.builtins.formatting.black,
		nls.builtins.formatting.isort,
		nls.builtins.formatting.stylua,
		nls.builtins.formatting.prettierd,
		nls.builtins.formatting.nixfmt,
		nls.builtins.formatting.prettier_d_slim.with({
			filetypes = vim.fn.extend(nls.builtins.formatting.prettier_d_slim.filetypes, { "solidity" }),
		}),
		nls.builtins.formatting.shfmt.with({
			filetypes = vim.fn.extend(nls.builtins.formatting.shfmt.filetypes, { "zsh", "bash" }),
		}),
	},
	on_attach = default_on_attach,
})

-- }}}

local lspinstaller = require("nvim-lsp-installer")

lspinstaller.on_server_ready(function(server)
	local server_setup = server_setups[server.name] or server_setups["default"]
	local config = type(server_setup) == "function" and server_setup() or server_setup
	config.capabilities = require("cmp_nvim_lsp").update_capabilities(
		config.capabilities or vim.lsp.protocol.make_client_capabilities()
	)
	server:setup(config)
end)

-- vim.lsp.set_log_level(vim.lsp.log_levels.INFO)
