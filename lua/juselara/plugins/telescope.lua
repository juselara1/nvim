return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {"nvim-lua/plenary.nvim"},
	keys = {
		{
			"<leader>t",
			desc = "Fuzzy file"
		},
		{
			"<leader>b",
			desc = "Buffers"
		}
	},
	config = function ()
		local builtin = require("telescope.builtin")

		vim.keymap.set('n', "<leader>t", builtin.find_files, {noremap = true, silent=true, desc="Fuzzy file"})
		vim.keymap.set('n', "<leader>b", builtin.buffers, {noremap = true, silent=true, desc="Buffers"})
	end
}
