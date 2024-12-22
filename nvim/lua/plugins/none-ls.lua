return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- Lua --
                null_ls.builtins.formatting.stylua,
                -- Python --
                -- TODO: codespell seems to be not working
                null_ls.builtins.formatting.codespell,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.diagnostics.mypy,
                -- Go --
                null_ls.builtins.formatting.gofmt,
                null_ls.builtins.formatting.goimports,
                null_ls.builtins.formatting.golines,
            },
        })
    end,
}
