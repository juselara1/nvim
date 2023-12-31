return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	cmd = "TSUpdate",
	event = { "BufReadPre", "BufNewFile"},
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"AckslD/nvim-trevJ.lua"
	},
	config = function()
		require("nvim-treesitter.configs").setup {
			ensure_installed = {
				"python", "commonlisp", "bash", "c",
				"lua", "rust", "julia", "dockerfile",
				"gitignore", "markdown", "json"
			},
			highlight = {enable = true},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn",
					node_incremental = "gan",
					node_decremental = "gdn"
				}
			}
		}
	end,
}
