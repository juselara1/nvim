return {
	"nvim-tree/nvim-tree.lua",
	keys = {
		{
			"<leader>e",
			desc = "Nvim tree"
		},
	},
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("nvim-tree").setup {
			sort = {
				sorter = "case_sensitive"
			},
			view = {
				width = 30
			}
		}

		vim.keymap.set(
			'n', "<leader>e", ":NvimTreeToggle<CR>", {
				noremap = true, silent=false,
				desc="Nvim tree"
				}
			)
	end
}
