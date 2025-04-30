vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 4 -- 4 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.softtabstop = 4 -- Number of spaces that a tab counts for while performing editing operations
opt.smartindent = true -- Enable smart indentation to automatically adjust indentation based on syntax

-- line wrapping
opt.wrap = false -- disable line wrapping
opt.linebreak = true -- companion to wrap don't split words
opt.scrolloff = 8

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- Disable backup files
opt.backup = false

-- appearance
opt.termguicolors = true -- set termguicolors to enable highlight groups
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus")-- Sync clipboard between OS and Neovim.

-- split windows
opt.splitright = true -- fource split vertical window to the right
opt.splitbelow = true --  fource split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- search
opt.hlsearch = false -- Disable highlighting of search results after search is complete
opt.incsearch = true -- Enable incremental search highlighting

opt.undofile = true -- Save undo history



-- Spellcheck and conceal links etc for markdown files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	command = "set conceallevel=2 | set spell"
})
