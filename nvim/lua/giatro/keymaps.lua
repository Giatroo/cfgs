--------------------------------------------------------------------------------
-- ==> Prior Lua helping tools
--------------------------------------------------------------------------------

local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

--------------------------------------------------------------------------------
-- ==> Leader key
--------------------------------------------------------------------------------

-- Space is the leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.localleader = " "

--------------------------------------------------------------------------------
-- ==> Navegation
--------------------------------------------------------------------------------

-- Ctrl + hkjl -> navigate through the splits
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Shift + l -> go to the next buffer
keymap("n", "<S-l>", ":bnext<CR>", opts)
-- Shift + h -> go to the previous buffer
keymap("n", "<S-h>", ":bprevious<CR>", opts)
-- Ctrl + b -> show all the open buffers
keymap("n", "<C-b>", ":buffers<CR>", opts)

-- Easier way to go back to file structure (this probably is temporary)
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

--------------------------------------------------------------------------------
-- ==> Window
--------------------------------------------------------------------------------

-- Alt + hjkl -> resize the splits
keymap("n", "<M-j>", ":resize +2<CR>", opts)
keymap("n", "<M-k>", ":resize -2<CR>", opts)
keymap("n", "<M-h>", ":vertical resize +2<CR>", opts)
keymap("n", "<M-l>", ":vertical resize -2<CR>", opts)

--------------------------------------------------------------------------------
-- ==> Misc.
--------------------------------------------------------------------------------

-- Persistend indentation inside visual mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Fast movement of lines
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Better J (keeps cursor in the same place when clicking J)
keymap("n", "J", "mzJ`z", opts)

-- As I use a portuguese keyboard, I like to use the ç key as :
keymap("n", "ç", ":", opts)
