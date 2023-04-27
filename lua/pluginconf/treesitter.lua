status, _ = pcall(require, "nvim-treesitter")
if not status then return end

require("nvim-treesitter.configs").setup {
	ensure_installed = {
        "python", "commonlisp", "bash", "julia",
        "c", "lua", "go", "rust",
        "html", "javascript", "cpp",
    },
	highlight = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm"
		}
	},
	indent = {
		enable = false,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = 1000
	}
}
