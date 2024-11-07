return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local gitsigns = require("gitsigns")
		gitsigns.setup({
			numhl = true,
		})

		local wk = require("which-key")
		wk.add({
			{
				"<leader>g",
				group = "Git",
			},
			{
				"<leader>gb",
				group = "Git Blame",
			},
			{
				"<leader>gh",
				group = "Git Hunk",
			},
			{
				"[c",
				"<cmd>Gitsigns prev_hunk<cr>",
				desc = "Prev git hunk",
			},
			{
				"]c",
				"<cmd>Gitsigns next_hunk<cr>",
				desc = "Next git hunk",
			},
			{
				"<leader>gbl",
				"<cmd>Gitsigns blame_line<cr>",
				desc = "Blame line",
			},
			{
				"<leader>gbb",
				"<cmd>Gitsigns blame<cr>",
				desc = "Blame buffer",
			},
			{
				"<leader>gbl",
				"<cmd>Gitsigns toggle_current_line_blame<cr>",
				desc = "Blame line",
			},
			{
				"<leader>ghp",
				"<cmd>Gitsigns preview_hunk<cr>",
				desc = "Preview current hunk",
			},
			{
				"<leader>ghs",
				"<cmd>Gitsigns stage_hunk<cr>",
				desc = "Stage hunk",
			},
			{
				"<leader>ghS",
				"<cmd>Gitsigns stage_buffer<cr>",
				desc = "Stage buffer",
			},
			{
				"<leader>ghr",
				"<cmd>Gitsigns reset_hunk<cr>",
				desc = "Reset hunk",
			},
			{
				"<leader>ghR",
				"<cmd>Gitsigns reset_buffer<cr>",
				desc = "Reset buffer",
			},
			{
				"<leader>ghu",
				"<cmd>Gitsigns undo_stage_hunk<cr>",
				desc = "Undo stage hunk",
			},
		})
	end,
}
