local function setup ()
	local ls = require("luasnip")
	local fmt = require("luasnip.extras.fmt").fmt
	local fmta = require("luasnip.extras.fmt").fmta
	local s = ls.snippet
	local i = ls.insert_node
	local t = ls.text_node

	ls.add_snippets("c", {
		-- Define variable
		s("@var", fmt("{} {} = {};", {i(1, "int"), i(2, "var"), i(3, "1")})),
		-- Import
		s("@import", fmt("#include <{}>", {i(1, "name")})),
		-- Main
		s("@main", fmta(
		[[
		int main(void)
		{
			<body>
			return 0;
		}
		]]
		, {body=i(1, ';')}
		)),
	})
end

return {
	setup = setup
}
