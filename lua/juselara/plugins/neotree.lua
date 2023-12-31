return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{
			"<leader>e",
			mode='n',
			":Neotree filesystem toggle<CR>",
			desc="Neotree"
		},
		{
			"<leader>ge",
			mode='n',
			":Neotree git_status toggle<CR>",
			desc="Neotree Git"
		}
	},
	config = function ()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible=true
				}
			}
		})
	end
}
