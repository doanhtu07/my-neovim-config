-- Use `:options` to view all options

-- To make file explorer easier to view
vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- Number of screen lines to show around the cursor
-- opt.scrolloff = 10

-- Use relative number in Neovim
opt.relativenumber = true

-- Show absolute current line number
opt.number = true

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false -- not wrapping text when line is long
opt.smoothscroll = true

-- search settings using `/` and `?`
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

opt.guicursor = {
	"n-v-c:block-Cursor/lCursor-blinkwait1000-blinkon50-blinkoff15",
	"i-ci:ver25-Cursor/lCursor-blinkwait1000-blinkon50-blinkoff15",
	"r:hor50-Cursor/lCursor-blinkwait100-blinkon50-blinkoff15",
}

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschems that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
-- opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
