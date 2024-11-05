return {
	"nvim-treesitter/nvim-treesitter",
	-- event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	ops = {
		ensure_installed = {
			"lua",
			"vim",
			"vimdoc",
			"query",
			"gitignore",
			"python",
		},
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		autopairs = {
			enable = true,
		},
	},
}
