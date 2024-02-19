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
		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

		parser_config.nu = {
		  install_info = {
			url = "https://github.com/nushell/tree-sitter-nu",
			files = { "src/parser.c" },
			branch = "main",
		  },
		  filetype = "nu",
		}
		vim.filetype.add({
			extension = {
				nu = "nu"
			}
		})
		require("nvim-treesitter.configs").setup {
			ensure_installed = {
				"python", "commonlisp", "bash", "c",
				"lua", "rust", "julia", "dockerfile",
				"gitignore", "markdown", "json",
				"nu"
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
