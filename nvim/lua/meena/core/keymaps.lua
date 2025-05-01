-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Default options for keymaps
local opts = { noremap = true, silent = true }
local km = vim.keymap
-- Helper to merge opts with description
local function map(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", opts, { desc = desc }))
end

-- Disable default behavior of <Space> in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

---------------------
-- General Keymaps
---------------------

map("i", "jk", "<ESC>", "Exit insert mode with jk")
map("n", "x", '"_x', "Delete character without yanking")

---------------------
-- Window Management
---------------------

map("n", "<leader>sv", "<C-w>v", "Split window vertically")
map("n", "<leader>sh", "<C-w>s", "Split window horizontally")
map("n", "<leader>se", "<C-w>=", "Make splits equal size")
map("n", "<leader>sx", "<cmd>close<CR>", "Close current split")

---------------------
-- Tab Management
---------------------

map("n", "<leader>to", "<cmd>tabnew<CR>", "Open new tab")
map("n", "<leader>tx", "<cmd>tabclose<CR>", "Close current tab")
map("n", "<leader>tn", "<cmd>tabn<CR>", "Go to next tab")
map("n", "<leader>tp", "<cmd>tabp<CR>", "Go to previous tab")
map("n", "<leader>tf", "<cmd>tabnew %<CR>", "Open current buffer in new tab")

---------------------
-- Save, Quit, Explore
---------------------

map("n", "<C-s>", "<cmd>w<CR>", "Save file")
map("n", "<C-q>", "<cmd>q<CR>", "Quit file")
map("n", "<C-e>", ":Explore<CR>", "Open netrw file explorer")

---------------------
-- Buffer Navigation
---------------------

map("n", "<Tab>", ":bnext<CR>", "Go to next buffer")
map("n", "<S-Tab>", ":bprevious<CR>", "Go to previous buffer")

---------------------
-- Line/Block Movement
---------------------

map("v", "J", ":m '>+1<CR>gv=gv", "Move selected block down")
map("v", "K", ":m '<-2<CR>gv=gv", "Move selected block up")

---------------------
-- Copy, Cut, Paste, Delete
---------------------

map("n", "<leader>dl", '"_dd', "Delete line without yanking")
map("v", "<leader>dl", '"_d', "Delete selection without yanking")

map("n", "<leader>cc", [["+y]], "Yank line to system clipboard")
map("v", "<leader>cc", [["+y]], "Yank selection to system clipboard")

map("n", "<leader>cx", [["+d]], "Cut line to system clipboard")
map("v", "<leader>cx", [["+d]], "Cut selection to system clipboard")

map("v", "pp", '"_dP', "Paste over selection without losing clipboard")
map("n", "<leader>p", [["+p]], "Paste from system clipboard")

map("n", "<leader>dd", ":t.<CR>", "Duplicate current line")



