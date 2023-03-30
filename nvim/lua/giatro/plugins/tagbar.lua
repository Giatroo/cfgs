vim.keymap.set('n', '<leader>t', 'TagBarToggle<CR>')
--vim.g.which_key_map.t = 'Tag menu'

-- Move the cursor to the tag window when open it
vim.g.tagbar_autofocus = 1

-- Leave the tags in the same order as they're in the file
vim.g.tagbar_sort = 0

-- Compact mode
vim.g.tagbar_compact = 1

-- Remove the symbols +, # and - (for public, protected and private)
vim.g.tagbar_show_visibility = 0

-- Shows the tag count next to the tag kind
vim.g.tagbar_show_tag_count = 1

-- The width
vim.g.tagbar_width = 25

