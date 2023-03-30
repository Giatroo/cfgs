

local on_attach = function (bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)
    vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', 'h', api.node.open.edit, opts('Close'))
end

require("nvim-tree").setup({
    on_attach=on_attach,
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = false,
        debounce_delay = 50,
        severity = {
            min = vim.diagnostic.severity.HINT,
            max = vim.diagnostic.severity.ERROR,
        },
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    modified = {
        enable = true,
        show_on_open_dirs = false,
    }
})
