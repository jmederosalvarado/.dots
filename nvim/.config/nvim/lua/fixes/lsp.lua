local lspconfig = require("lspconfig")
local configs = require("lspconfig/configs")

if not lspconfig["vscode-solidity"] then
	configs["vscode-solidity"] = {
		default_config = {
			filetypes = { "solidity" },
			root_dir = function(fname)
				return lspconfig.util.find_git_ancestor(fname)
					or lspconfig.util.find_node_modules_ancestor(fname)
					or lspconfig.util.find_package_json_ancestor(fname)
					or vim.loop.cwd()
			end,
			init_options = vim.fn.stdpath("cache"),
			settings = {
				solidity = {
					nodemodulespackage = "solc",
					compileUsingRemoteVersion = "latest",
					compilerOptimization = 200,
					compileUsingLocalVersion = "",
					defaultCompiler = "remote", -- remote | localFile | localNodeModule | embedded
					linter = "solhint", -- solhint | solium
					solhintRules = nil,
					formatter = "prettier", -- prettier | none
					soliumRules = {
						["imports-on-top"] = 0,
						["variable-declarations"] = 0,
						["indentation"] = { "off", 4 },
						["quotes"] = { "off", "double" },
					},
					enabledAsYouTypeCompilationErrorCheck = true,
					validationDelay = 1500,
					packageDefaultDependenciesDirectory = "node_modules",
					packageDefaultDependenciesContractsDirectory = "",
				},
			},
			handlers = {
				["textDocument/publishDiagnostics"] = (function()
					local on_publish_diagnostics = vim.lsp.handlers["textDocument/publishDiagnostics"]
					return function(err, result, ctx, config)
						if result and result.diagnostics then
							for _, d in ipairs(result.diagnostics) do
								d.range["start"].line = d.range.start.line or 0
								d.range["start"].character = d.range.start.line or 0
								d.range["end"].line = d.range.start.line or 0
								d.range["end"].character = d.range.start.line or 0
							end
						end
						return on_publish_diagnostics(err, result, ctx, config)
					end
				end)(),
			},
		},
	}
end

-- 1. get the default config from nvim-lspconfig
local config = require("lspinstall/util").extract_config("vscode-solidity")
-- 2. update the cmd. relative paths are allowed, lspinstall automatically adjusts the cmd and cmd_cwd for us!
config.default_config.cmd = { "node", "./out/src/server.js", "--stdio" }

-- 3. extend the config with an install_script and (optionally) uninstall_script
require("lspinstall/servers").solidity = vim.tbl_extend("error", config, {
	-- lspinstall will automatically create/delete the install directory for every server
	install_script = [[
	curl -sSL 'https://github.com/juanfranblanco/vscode-solidity/archive/master.tar.gz' | tar xvz --strip-components=1
	npm install --no-package-lock --ignore-scripts && npm run compile
	]],
	uninstall_script = nil, -- can be omitted
})
