vim.g.pydocstring_formatter = "numpy"

function PYTHON_BINDINGS()
    vim.api.nvim_buf_set_keymap(0, "n", "<leader>Pd", "<Plug>(pydocstring)", { noremap = false })
end

vim.cmd("autocmd FileType python lua PYTHON_BINDINGS()")
