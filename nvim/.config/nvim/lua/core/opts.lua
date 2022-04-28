-- if using vscode, don't set ui related opts
if not vim.g.vscode then
	vim.o.title = true
	vim.o.shortmess = vim.o.shortmess .. "sI" -- disable nvim intro

	-- disable mode display
	vim.o.showmode = false

	-- buffer is unloaded when it is abandoned (maybe needed for lsp go-to-definition)
	vim.o.hidden = true
	vim.o.mouse = "a"

	-- number and sign column
	vim.o.number = true
	vim.o.numberwidth = 2
	vim.o.relativenumber = true
	vim.o.signcolumn = "yes"

	-- context
	vim.o.cursorline = true
	vim.o.cursorcolumn = false

	-- lines/columns of context
	vim.o.scrolloff = 4
	vim.o.sidescrolloff = 4

	-- colors
	vim.o.termguicolors = true
	vim.o.bg = "dark"

	-- show some invisible characters (e.g. tabs, spaces)
	vim.o.list = true
	vim.o.listchars = "trail:·,tab:» "
	vim.o.showbreak = "↪ "
	-- disable tilde on end of buffer: https://github.com/neovim/neovim/pull/8546#issuecomment-643643758
	vim.o.fillchars = "eob: "

	-- fold
	-- vim.o.foldminlines = 10
	-- vim.o.foldminlines = 10
	-- vim.o.foldmethod = "marker"
	vim.o.foldmethod = "manual"

	vim.o.cmdheight = 2
end

-- tabs, spaces and indentation
vim.o.tabstop = 4 -- tab width in spaces
vim.o.softtabstop = 4
vim.o.shiftwidth = 4 -- number of spaces to use for each step of (auto)indent
vim.o.shiftround = true -- round indent to multiple of 'shiftwidth'
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.smartindent = true -- insert indents automatically

-- casing
vim.o.ignorecase = true
vim.o.smartcase = true

-- time to wait for a mapped sequence to complete
vim.o.timeoutlen = 400

vim.o.splitbelow = true -- put new windows below current
vim.o.splitright = true -- put new windows right of current

vim.o.swapfile = false
vim.o.undofile = true -- persist undo history between editing sessions
vim.o.undolevels = 10000 -- undo history max size
vim.o.updatetime = 200 -- save swap file and trigger `CursorHold`

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
-- vim.o.whichwrap:append "<>[]hl"

-- leader
vim.g.mapleader = " "

-- disable some builtin vim plugins
local disabled_builtins = {
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"matchit",
	"tar",
	"tarPlugin",
	"rrhelper",
	"spellfile_plugin",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
}

-- don't create annoying .netrwhist file
-- this is just for future reference, as netrw is currently being disabled
vim.g.netrw_dirhistmax = 0

for _, plugin in pairs(disabled_builtins) do
	vim.g["loaded_" .. plugin] = 1
end
