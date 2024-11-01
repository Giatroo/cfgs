return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                -- TODO: codespell seems to be not working
                null_ls.builtins.formatting.codespell,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.diagnostics.mypy,
            },
        })
    end,
}
