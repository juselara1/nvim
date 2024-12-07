return {
	"stevearc/oil.nvim",
	opts = {
		default_file_explorer = false,
		columns = {"icon", "permissions"},
		float = {
			preview_split = "right",
		},
		view_options = {
			show_hidden = true
		}
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{
			"<leader>o",
			mode="n",
			":Oil --float<CR>",
			desc="Oil file explorer"
		}
	}
}
