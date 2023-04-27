status, _ = pcall(require, "lualine")
if not status then return end
require("lualine").setup({
	options = {
		theme = "everforest",
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
        lualine_x = {
            "aerial"
        }
	}
})

