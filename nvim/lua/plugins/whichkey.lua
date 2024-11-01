return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
        {
            "<leader>q",
            "<cmd>q<cr>",
            desc = "Close Buffer",
        },
        {
            "<leader>y",
            'gg"+yG',
            desc = "Yank File",
        },
        {
            "<leader>d",
            'gg"+dG',
            desc = "Cut File",
        },
        {
            "<leader>v",
            group = "Vim",
        },
        {
            "<leader>vn",
            "<cmd>set nu!<cr>",
            desc = "Toggle Line Numbers",
        },
        {
            "<leader>vr",
            "<cmd>set rnu!<cr>",
            desc = "Toggle Relative Line Numbers",
        },
        {
            "<leader>vh",
            "<cmd>nohlsearch<cr>",
            desc = "Clear Search Highlight",
        },
        {
            "<leader>v|",
            "<cmd>vsplit<cr>",
            desc = "Split Right",
        },
        {
            "<leader>v_",
            "<cmd>split<cr>",
            desc = "Split Down",
        },
    },
    dependencies = {
        "echasnovski/mini.icons",
        "nvim-tree/nvim-web-devicons",
    },
}
