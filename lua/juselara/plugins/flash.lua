return {
	"folke/flash.nvim",
	opts = {},
	keys = {
		{
			"<leader>fs",
			mode="n",
			function () require("flash").jump() end,
			desc="Flash Search"
		},
		{
			"<leader>fl",
			mode="n",
			function () 
				require("flash").jump({
					search = {mode = "search", max_lenght=0},
					label = { after = {0, 0}},
					pattern = "^"
				})
			end, desc="Flash Line"
		},
	},
}
