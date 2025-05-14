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
-- Here is a utility function that closes any floating windows when you press escape
local function close_floating()
    for _, win in pairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_config(win).relative == "win" then
            vim.api.nvim_win_close(win, false)
        end
    end
end
-- Disable default behavior of <Space> in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

---------------------
-- General Keymaps
---------------------

map("i", "jk", "<ESC>", "Exit insert mode with jk")
map("n", "X", '"_x', "Delete character without yanking")

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

map("n", "<leader>tn", "<cmd>tabnew<CR>", "Open new tab")
map("n", "<leader>tx", "<cmd>tabclose<CR>", "Close current tab")

map("n", "<leader>tl", "<cmd>tabn<CR>", "Go to next tab")
map("n", "<leader>th", "<cmd>tabp<CR>", "Go to previous tab")
map("n", "<leader>tb", "<cmd>tabnew %<CR>", "Open current buffer in new tab")

---------------------
-- Save, Quit, Explore
---------------------

map("n", "<leader>ss", "<cmd>w<CR>", "Save file")
map("n", "<leader>qq", "<cmd>q<CR>", "Quit file")
map("n", "<leader>ee", ":Explore<CR>", "Open netrw file explorer")

---------------------
-- Buffer Navigation
---------------------

map("n", "<Tab>", ":bnext<CR>", "Go to next buffer")
map("n", "<S-Tab>", ":bprevious<CR>", "Go to previous buffer")

---------------------
-- Line/Block Movement
---------------------

map({ "n", "v" }, "J", ":m '>+1<CR>gv=gv", "Move selected block down")
map({ "n", "v" }, "K", ":m '<-2<CR>gv=gv", "Move selected block up")

---------------------
-- Copy, Cut, Paste, Delete select
---------------------
map("n", "<Leader>oa", "ggVG<c-$>", "Select All")

map("n", "<leader>odl", '"_dd', "Delete line without yanking")
map("v", "<leader>odl", '"_d', "Delete selection without yanking")

map({ "n", "v" }, "<leader>oc", [["+y]], "Yank line to system clipboard")
-- Make visual yanks place the cursor back where started
map("v", "oy", "ygv<Esc>", "Yank and reposition cursor")
km.set("n", "<esc>", function()
    close_floating()
    vim.cmd(":noh")
end, { silent = true, desc = "Remove Search Highlighting, Dismiss Popups" })


map({ "n", "v" }, "<leader>ox", [["+d]], "Cut line to system clipboard")

map("v", "opp", '"_dP', "Paste over selection without losing clipboard")
map("n", "<leader>op", [["+p]], "Paste from system clipboard")
map({ "n", "x" }, "[p", '<Cmd>exe "put! " . v:register<CR>', "Paste Above")
map({ "n", "x" }, "]p", '<Cmd>exe "put "  . v:register<CR>', "Paste Below")

map("n", "<leader>odd", ":t.<CR>", "Duplicate current line")
