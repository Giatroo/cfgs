return {
    "nvim-lualine/lualine.nvim",
    opts = {
        options = {
            disabled_filetypes = { "alpha", "dashboard", "neo-tree", "trouble" },
            theme = "palenight",
        },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
