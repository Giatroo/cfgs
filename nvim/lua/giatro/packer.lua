-- This file can be loaded by calling lua require('plugins') from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

local packer = require("packer")
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

return packer.startup(function(use)
    use("wbthomason/packer.nvim")

    ----------
    -- Main --
    ----------
    -- LSP
    use("neovim/nvim-lspconfig")          -- enable LSP
    use("williamboman/mason.nvim")        -- simple to use language server installer
    use("williamboman/mason-lspconfig.nvim") -- mason configuration
    use("jose-elias-alvarez/null-ls.nvim") -- suport to formating, linting, ...

    -- Completion
    use("hrsh7th/nvim-cmp")      -- completion engine
    use("hrsh7th/cmp-buffer")    -- buffer completions
    use("hrsh7th/cmp-path")      -- path completions
    use("hrsh7th/cmp-cmdline")   -- cmdline completions
    use("hrsh7th/cmp-nvim-lsp")  -- lsp completions
    use("hrsh7th/cmp-nvim-lua")  -- nvim completions
    use("saadparwaiz1/cmp_luasnip") -- snippet completions

    use("github/copilot.vim")    -- GitHub Copilot

    -- Snippets
    use({
        "L3MON4D3/LuaSnip",
        -- install jsregexp (optional!:).
        run = "make install_jsregexp",
    })                               -- snippet engine
    use("rafamadriz/friendly-snippets") -- community snippet pack

    -- Git
    use("lewis6991/gitsigns.nvim")

    ------------
    -- Window --
    ------------
    -- Status Line
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })

    -- Tagbar
    use("preservim/tagbar")

    -- File Explorer
    use("nvim-tree/nvim-tree.lua")
    use("nvim-tree/nvim-web-devicons")

    -- Tabs
    use("akinsho/bufferline.nvim")
    use("moll/vim-bbye")

    -- Projects manager
    use("ahmedkhalf/project.nvim")

    -- Startup window
    use("goolord/alpha-nvim")
    -- This is needed to fix lsp doc highlight
    use("antoinemadec/FixCursorHold.nvim")

    -- Terminal
    use("akinsho/nvim-toggleterm.lua")

    ------------
    -- Syntax --
    ------------
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

    -- Autopairs, integrates with both cmp and treesitter
    use("windwp/nvim-autopairs")

    -- Comment
    use("numToStr/Comment.nvim")

    -- Python docstring
    use({ "heavenshell/vim-pydocstring", run = "make install" })

    ----------
    -- Misc --
    ----------
    -- Shows options for leader key as a menu
    use("folke/which-key.nvim")

    -- Fuzzing finder for vim
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    -- Faster movement
    use("unblevable/quick-scope")

    -- Faster startup
    use("lewis6991/impatient.nvim")

    -- Wakatime
    use("wakatime/vim-wakatime")

    ------------
    -- Themes --
    ------------
    use("navarasu/onedark.nvim")
    require("onedark").load()
end)
