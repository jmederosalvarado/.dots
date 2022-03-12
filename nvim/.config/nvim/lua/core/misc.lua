if vim.g.vscode then
	return
end

local M = {}

-- AUTOCMDS {{{

-- Use relative & absolute line numbers in 'n' & 'i' modes respectively
vim.cmd([[ au InsertEnter * set norelativenumber ]])
vim.cmd([[ au InsertLeave * set relativenumber ]])

-- Use absolute numbers on unfocused windows
vim.cmd([[ au BufLeave,WinLeave * lua require('core.misc').win_changed(false) ]])
vim.cmd([[ au BufEnter,WinEnter * lua require('core.misc').win_changed(true) ]])

M.win_changed = function(entering)
	local ignore = {
		filetypes = {
			"NvimTree",
			"packer",
			"startify",
			"fugitive",
			"fugitiveblame",
			"qf",
			"help",
		},
		buftypes = {
			"terminal",
		},
		bufnames = {},
	}
	if
		vim.tbl_contains(ignore.filetypes, vim.bo.filetype)
		or vim.tbl_contains(ignore.buftypes, vim.bo.buftype)
		or vim.tbl_contains(ignore.bufnames, vim.api.nvim_buf_get_name(0))
	then
		return
	end

	vim.o.relativenumber = entering
end

-- Don't show any numbers inside terminals
vim.cmd([[ au TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal ]])

-- File extension specific tabbing
vim.cmd([[ au Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 ]])

-- Highlight on yank
vim.cmd([[ au TextYankPost * silent! lua vim.highlight.on_yank({ on_visual = false })]])

-- }}}

-- APPEARANCE {{{

-- DIAGNOSTIC {{{

local function diagnostic_sign_define(name, _)
	local hl = "DiagnosticSign" .. name
	local numhl = "DiagnosticNum" .. name
	vim.fn.sign_define(hl, { text = "", numhl = numhl })
end

diagnostic_sign_define("Error", "")
diagnostic_sign_define("Info", "")
diagnostic_sign_define("Hint", "")
diagnostic_sign_define("Warn", "")

vim.diagnostic.config({
	virtual_text = {
		spacing = 4,
		prefix = "",
		source = "if_many",
		severity = {
			min = vim.diagnostic.severity.INFO,
		},
	},
	severity_sort = true,
	update_in_insert = true,
	underline = false,
	float = { border = "solid" },
})

-- local diagnostic_get = vim.diagnostic.get
-- vim.diagnostic.get = function(bufnr, opts)
-- 	return diagnostic_get(
-- 		bufnr,
-- 		vim.tbl_deep_extend("force", opts or {}, {
-- 			severity = { min = vim.diagnostic.severity.INFO },
-- 		})
-- 	)
-- end

-- }}}

-- LSP {{{

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "solid",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "solid",
})

-- suppress error messages from lang servers
vim.notify = function(msg, log_level)
	if msg:match("exit code") then
		return
	end
	if log_level == vim.log.levels.ERROR then
		vim.api.nvim_err_writeln(msg)
	else
		vim.api.nvim_echo({ { msg } }, true, {})
	end
end

-- }}}

-- }}}

return M
