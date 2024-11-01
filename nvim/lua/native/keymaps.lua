local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

--------------------------------------------------------------------------------
--   _                       _               _   __
--  | |                     | |             | | / /
--  | |      ___   __ _   __| |  ___  _ __  | |/ /   ___  _   _
--  | |     / _ \ / _` | / _` | / _ \| '__| |    \  / _ \| | | |
--  | |____|  __/| (_| || (_| ||  __/| |    | |\  \|  __/| |_| |
--  \_____/ \___| \__,_| \__,_| \___||_|    \_| \_/ \___| \__, |
--                                                         __/ |
--                                                        |___/
--------------------------------------------------------------------------------

-- Space is the leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.localleader = " "

--------------------------------------------------------------------------------
--   _   _                                   _    _
--  | \ | |                                 | |  (_)
--  |  \| |  __ _ __   __ ___   __ _   __ _ | |_  _   ___   _ __
--  | . ` | / _` |\ \ / // _ \ / _` | / _` || __|| | / _ \ | '_ \
--  | |\  || (_| | \ V /|  __/| (_| || (_| || |_ | || (_) || | | |
--  \_| \_/ \__,_|  \_/  \___| \__, | \__,_| \__||_| \___/ |_| |_|
--                              __/ |
--                             |___/
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

-- Alt + hjkl -> resize the splits
keymap("n", "<M-j>", ":resize +2<CR>", opts)
keymap("n", "<M-k>", ":resize -2<CR>", opts)
keymap("n", "<M-h>", ":vertical resize +2<CR>", opts)
keymap("n", "<M-l>", ":vertical resize -2<CR>", opts)

--------------------------------------------------------------------------------
--  ___  ___ _
--  |  \/  |(_)
--  | .  . | _  ___   ___
--  | |\/| || |/ __| / __|
--  | |  | || |\__ \| (__  _
--  \_|  |_/|_||___/ \___|(_)
--------------------------------------------------------------------------------

-- Persistend indentation inside visual mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Fast movement of lines
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Better J (keeps cursor in the same place when clicking J)
keymap("n", "J", "mzJ`z", opts)
