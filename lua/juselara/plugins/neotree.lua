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
	},
	config = function ()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible=true
				}
			},
			event_handlers = {
				{
					event = "neo_tree_buffer_enter",
					handler = function(_)
						vim.cmd("setlocal relativenumber")
					end
				}
			}
		})
	end
}
