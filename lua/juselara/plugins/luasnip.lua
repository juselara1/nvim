return {
	"L3MON4D3/LuaSnip",
	version = "v2.3.0",
	run = "make install_jsregexp",
	config = function()
		local ls = require("luasnip")

		local s = ls.snippet
		local t = ls.text_node
		local i = ls.insert_node

		vim.keymap.set({'i'}, "<C-k>", function() ls.expand() end, {silent=true})
	end
}
