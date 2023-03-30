local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    sources = {
        -- Lua
        formatting.stylua,

        -- Python
        diagnostics.flake8,
        diagnostics.pyproject_flake8,
        diagnostics.pylint.with({
            diagnostics_postprocess = function (diagnostic)
                diagnostic.code = diagnostic.message_id
            end,
        }),
        diagnostics.mypy,
        diagnostics.pydocstyle,
        formatting.black,
        formatting.isort,
    }
})
