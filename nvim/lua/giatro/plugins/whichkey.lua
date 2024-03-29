local wk = require("which-key")

local configs = {
    icons = {
        breadcrumb = "»",
        separator = "➜",
        group = " ",
    },
}

local opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
}

local mappings = {
    ["/"] = { '<cmd>lua require("Comment.api").toggle.linewise()<CR>', "Comment" },
    ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
    ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
    ["w"] = { "<cmd>w!<CR>", "Save" },
    ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
    ["f"] = { "<cmd>Format<CR>", "Format" },
    ["y"] = { 'gg"+yG', "Yank file" },
    ["d"] = { 'gg"+dG', "Cut file" },
    p = {
        name = "Packer",
        c = { "<cmd>PackerCompile<cr>", "Compile" },
        i = { "<cmd>PackerInstall<cr>", "Install" },
        s = { "<cmd>PackerSync<cr>", "Sync" },
        S = { "<cmd>PackerStatus<cr>", "Status" },
        u = { "<cmd>PackerUpdate<cr>", "Update" },
    },
    g = {
        name = "Git",
        l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
        R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
        s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
        u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
        o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
    },
    l = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Goto Definition" },
        D = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Goto Declaration" },
        K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
        w = {
            "<cmd>Telescope lsp_workspace_diagnostics<cr>",
            "Workspace Diagnostics",
        },
        f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
        i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Goto Implementation" },
        I = { "<cmd>LspInfo<cr>", "Info" },
        l = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Open Float" },
        q = { "<cmd>lua vim.diagnostic.set_loclist()<cr>", "Quickfix" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        R = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = {
            "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
            "Workspace Symbols",
        },
    },
    s = {
        name = "Search",
        f = { "<cmd>Telescope find_files<cr>", "Find files" },
        g = { "<cmd>Telescope git_files<cr>", "Git files" },
        w = { "<cmd>Telescope grep_string<cr>", "Word" },
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
    },
    t = {
        name = "Terminal",
        n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
        t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "htop" },
        p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "python" },
        f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
        h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
        v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
    },
    v = {
        name = "Vim",
        n = { "<cmd>set number!<CR>", "Toggle number" },
        r = { "<c d>set relativenumber!<CR>", "Toggle relativenumber" },
        b = { "<cmd>buffers<CR>", "Show buffers" },
        h = { "<cmd>nohlsearch<CR>", "No Highlight" },
        ["|"] = { "<cmd>vsplit<CR>", "Split right" },
        ["_"] = { "<cmd>split<CR>", "Split below" },
    },
}

wk.setup(configs)
wk.register(mappings, opts)
