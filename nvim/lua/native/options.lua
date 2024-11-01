--------------------------------------------------------------------------------
-- ______                              _    _    _
-- |  ___|                            | |  | |  (_)
-- | |_  ___   _ __  _ __ ___    __ _ | |_ | |_  _  _ __    __ _
-- |  _|/ _ \ | '__|| '_ ` _ \  / _` || __|| __|| || '_ \  / _` |
-- | | | (_) || |   | | | | | || (_| || |_ | |_ | || | | || (_| |
-- \_|  \___/ |_|   |_| |_| |_| \__,_| \__| \__||_||_| |_| \__, |
--                                                          __/ |
--                                                         |___/
--------------------------------------------------------------------------------

-- Limit the amount of chars a line can have to 80 (that's a good standard)
vim.opt.textwidth = 80

-- Make tab equal to 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- Converts tabs into spaces
vim.opt.expandtab = true

-- Set the encoding to utf-8, for compatibility.
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Indents some text for you
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Avoid wrapping a line in the middle of a word
vim.opt.linebreak = true

-- When shifting lines, round the indentation to the nearest multiple of
-- shiftwidth
vim.opt.shiftround = true

-- If you're typing and goes beyond `textwidth` it wraps the line automatically
vim.opt.wrap = true

-- Inside git commit files, we want the textwidth to be 72 chars
vim.api.nvim_create_autocmd("FileType", {
	pattern = "gitcommit",
	command = "setlocal spell textwidth=72",
})

-- Remove spaces at the end of the line when saving
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	command = "%s/\\s\\+$//e",
})

-- Automatically format file when saving
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	command = "lua vim.lsp.buf.format()",
})

--------------------------------------------------------------------------------
--  _____  _                       _
-- |_   _|| |                     (_)
--   | |  | |__    ___  _ __ ___   _  _ __    __ _
--   | |  | '_ \  / _ \| '_ ` _ \ | || '_ \  / _` |
--   | |  | | | ||  __/| | | | | || || | | || (_| |
--   \_/  |_| |_| \___||_| |_| |_||_||_| |_| \__, |
--                                            __/ |
--                                           |___/
--------------------------------------------------------------------------------

-- Highlight the text based on its extension
vim.opt.syntax = "on"

-- Visual indication of the 80 chars
vim.opt.colorcolumn = "81"

-- Show line numbers on the left
vim.opt.number = true

-- Show line number on the left relatively to my current line
vim.opt.relativenumber = true

-- Always show the signcolumn (used to display LSP information for instance)
vim.opt.signcolumn = "yes"

-- Highlights the cursor line
vim.opt.cursorline = true

-- Automatic folds by indentation (but not automatically when I open a buffer)
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false

-- TODO: try latter with theme, this makes the terminal translucid
-- Enable true colors support in the terminal
vim.opt.termguicolors = false

-- Don't show mode information (e.g. -- INSERT --)
vim.opt.showmode = false

--------------------------------------------------------------------------------
--  _____     _  _  _
-- |  ___|   | |(_)| |
-- | |__   __| | _ | |_  ___   _ __
-- |  __| / _` || || __|/ _ \ | '__|
-- | |___| (_| || || |_| (_) || |
-- \____/ \__,_||_| \__|\___/ |_|
--------------------------------------------------------------------------------

-- Horizontal splits go below current split
vim.opt.splitbelow = true

-- Vertical splits go to the right of the current split
vim.opt.splitright = true

-- Don't update screen during macro and script execution
vim.opt.lazyredraw = true

-- The number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 3

-- Disable netrw (:Lex)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--------------------------------------------------------------------------------
--   _____                          _
--  /  ___|                        | |
--  \ `--.   ___   __ _  _ __  ___ | |__
--   `--. \ / _ \ / _` || '__|/ __|| '_ \
--  /\__/ /|  __/| (_| || |  | (__ | | | |
--  \____/  \___| \__,_||_|   \___||_| |_|
--------------------------------------------------------------------------------

-- Show in real time what I'm searching for
vim.opt.incsearch = true

-- Show search matches in highlight
vim.opt.hlsearch = true

-- Ignore case when searching
vim.opt.ignorecase = true

-- Automatically switch search to case-sensitive when search query contains an
-- uppercase letter
vim.opt.smartcase = true

--------------------------------------------------------------------------------
--  ___  ___ _
--  |  \/  |(_)
--  | .  . | _  ___   ___
--  | |\/| || |/ __| / __|
--  | |  | || |\__ \| (__  _
--  \_|  |_/|_||___/ \___|(_)
--------------------------------------------------------------------------------

-- Time to wait for mapped sequence to complete (in milliseconds)
vim.opt.timeoutlen = 100

-- Faster completion
vim.opt.updatetime = 300

-- Enable persistent undo
vim.undofile = true

-- Set python usage (some plugins may need)
-- Using asdf python version
vim.g.python_host_prog = "/home/giatro/.asdf/shims/python2"
vim.g.python3_host_prog = "/home/giatro/.asdf/shims/python3.12"
