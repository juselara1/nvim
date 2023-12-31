return {
	"debugloop/telescope-undo.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim"
	},
	keys = {
		{
			"<leader>u",
			mode = 'n',
			":Telescope undo<CR>",
			desc = "Undo"
		}
	},
	opts = {
		extensions = {
			undo = {}
		}
	},
	config = function ()
		require("telescope").setup(opts)
		require("telescope").load_extension("undo")
	end
}
