return {
	"nvim-lualine/lualine.nvim",
	priority=1000,
	config = function ()
		require("lualine").setup({
			options = {
				theme = "dracula",
				compontent_separators = "",
				section_separators = "",
				separator = ""
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = {
					{
						"diagnostics",
						sources = {"nvim_lsp"}
					},
					"filename"
				},
				-- lualine_x = {
				-- 	"aerial"
				-- }
			}
		})
	end
}
