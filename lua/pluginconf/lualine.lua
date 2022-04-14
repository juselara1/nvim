require("lualine").setup({
	options = {
		theme = "material",
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
		}
	}
})

