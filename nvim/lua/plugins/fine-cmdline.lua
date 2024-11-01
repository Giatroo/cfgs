return {
	"VonHeikemen/fine-cmdline.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{
			":",
			"<cmd>FineCmdline<CR>",
			desc = "Command line",
		},
	},
	opts = {
		cmdline = {
			prompt = ":",
		},
		popup = {
			position = {
				row = "5%",
				col = "50%",
			},
		},
	},
}
