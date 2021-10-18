-- tabs, spaces and indentation
vim.o.tabstop = 2 -- tab width in spaces
vim.o.softtabstop = 2
vim.o.shiftwidth = 2 -- number of spaces to use for each step of (auto)indent
vim.o.shiftround = true -- round indent to multiple of 'shiftwidth'
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.smartindent = true -- insert indents automatically

vim.o.number = true
vim.o.relativenumber = true
-- vim.o.scrolloff = 4
vim.o.sidescrolloff = 4 -- columns of context
vim.o.cursorline = true
-- vim.o.cursorcolumn = true
vim.wo.colorcolumn = "99999"

-- vim.o.wrap = false
vim.o.ignorecase = true
vim.o.smartcase = true -- honor casing when using capitals
vim.o.hlsearch = false -- don't highlight search
vim.o.hidden = true -- enable modified buffers in background

vim.o.list = true -- show some invisible characters (tabs...
vim.o.listchars = "trail:·,tab:» "
vim.o.showbreak = "↪ "

vim.o.mouse = "a" -- enable mouse mode

-- vim.o.pumblend = 10 -- pum transparency
-- vim.o.pumheight = 10 -- maximum number of entries in a popup

vim.o.splitbelow = true -- put new windows below current
vim.o.splitright = true -- put new windows right of current

vim.o.undofile = true -- persist undo history between editing sessions
vim.o.undolevels = 10000 -- undo history max size
vim.o.updatetime = 200 -- save swap file and trigger `CursorHold`

vim.o.termguicolors = true -- use 24-bits colors

vim.g.netrw_dirhistmax = 0 -- don't create annoying .netrwhist file

-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- disable mode display
vim.o.showmode = false
