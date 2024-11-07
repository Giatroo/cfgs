return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            file_ignore_patterns = {
                -- python
                "__pycache__",
                "venv",
                "_build",
                ".ipynb_checkpoints",
                ".mypy_cache",
            },
        },
        keys = {
            { "<leader>sf", "<cmd>Telescope find_files<cr>",  desc = "Find files" },
            { "<leader>sg", "<cmd>Telescope git_files<cr>",   desc = "Git files" },
            { "<leader>ss", "<cmd>Telescope live_grep<cr>",   desc = "String" },
            { "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "This word" },
            { "<leader>sb", "<cmd>Telescope buffers<cr>",     desc = "Buffers" },
            { "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
            { "<leader>sh", "<cmd>Telescope help_tags<cr>",   desc = "Find help" },
            { "<leader>sM", "<cmd>Telescope man_pages<cr>",   desc = "Man pages" },
            { "<leader>sr", "<cmd>Telescope oldfiles<cr>",    desc = "Open recent file" },
            { "<leader>sR", "<cmd>Telescope registers<cr>",   desc = "Registers" },
            { "<leader>sk", "<cmd>Telescope keymaps<cr>",     desc = "Keymaps" },
            { "<leader>sC", "<cmd>Telescope commands<cr>",    desc = "Commands" },
        },
        config = function()
            require("which-key").add({
                { "<leader>s", group = "Search" },
            })
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
