local function setup ()
	local ls = require("luasnip")
	local fmt = require("luasnip.extras.fmt").fmt
	local s = ls.snippet
	local sn = ls.snippet_node
	local i = ls.insert_node
	local t = ls.text_node
	local c = ls.choice_node
	local f = ls.function_node
	local d = ls.dynamic_node
	local nl = function() return t{"", ""} end

	ls.add_snippets("python", {
		-- Define variable
		s("@var", {
			c(1, {
				fmt("{} = {}", {i(1, "name"), i(2, "value")}),
				fmt("{} : {} = {}", {i(1, "name"), i(2, "type"), i(3, "value")})
			})
		}),
		-- Define function
		s("@fn", fmt(
		[[
		def {}({}) -> {}:
			"""
			{}

		{}
			:returns: {}
			:rtype: {}
			"""
			{}
		]], {
			i(1, "name"), i(2, "args"), i(3, "rtype"), i(4, "docstring"),
			d(5, function(args)
				local params_str = args[1][1]:gsub(" ", "")
				if params_str == '' then
					return sn(nil, t'')
				end
				local params = vim.split(params_str, ',')
				local nodes = {}
				for idx, param_str in ipairs(params) do
					local param = vim.split(param_str, ":")
					table.insert(nodes, t"\t")
					table.insert(nodes, t(string.format(":param %s: ", param[1])))
					table.insert(nodes, i(idx, "pdoc"))
					table.insert(nodes, nl())
					table.insert(nodes, t"\t")
					table.insert(nodes, t(string.format(":type %s: %s", param[1], param[2])))
					table.insert(nodes, nl())
				end
				return sn(nil, nodes)
			end, {2}),
			i(6, "rdoc"), f(function (args) return args[1][1] end, {3}), i(7, "body")
		}
		)),
	})
end

return {
	setup = setup
}
