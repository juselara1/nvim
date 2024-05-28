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
		-- Import
		s("@import", {
			c(1, {
				fmt("import {}", {i(1, "name")}),
				fmt("import {} as {}", {i(1, "name"), i(2, "alias")}),
				fmt("from {} import {}", {i(1, "name"), i(2, "module")}),
				fmt("from {} import {} as {}", {i(1, "name"), i(2, "module"), i(3, "alias")})
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
			i(1, "fname"), i(2, ""), i(3, "rtype"), i(4, "docstring"),
			d(5, function(args)
				local params_str = args[1][1]:gsub(" ", "")
				if params_str == '' then
					return sn(nil, t'')
				end
				local params = vim.split(params_str, ',')
				local nodes = {}
				for idx, param_str in ipairs(params) do
					local param = vim.split(param_str, ":")
					table.insert(nodes, nl())
					table.insert(nodes, t"\t")
					table.insert(nodes, t(string.format(":param %s: ", param[1])))
					table.insert(nodes, i(idx, "pdoc"))
					table.insert(nodes, nl())
					table.insert(nodes, t"\t")
					table.insert(nodes, t(string.format(":type %s: %s", param[1], param[2])))
				end
				return sn(nil, nodes)
			end, {2}),
			i(6, "rdoc"), f(function (args) return args[1][1] end, {3}), i(7, "body")
		}
		)),
		-- Define class
		s("@class", fmt(
		[[
		class {}({}):
			{}

			"""
			{}
		{}
			"""
			{}
		]], {
			i(1, "cname"), i(2, ""), i(3, ""),
			i(4, "docstring"), d(5, function(args)
				local attrs = {}
				for _, arg in ipairs(args[1]) do
					local attr = vim.split(arg:gsub(' ', ''), ':')
					table.insert(attrs, attr)
				end

				local nodes = {}
				for idx, attr in ipairs(attrs) do
					table.insert(nodes, nl())
					table.insert(nodes, t"\t")
					table.insert(nodes, t(string.format(":param %s: ", attr[1])))
					table.insert(nodes, i(idx, "pdoc"))
					table.insert(nodes, nl())
					table.insert(nodes, t"\t")
					table.insert(nodes, t(string.format(":type %s: %s", attr[1], attr[2])))
				end
				return sn(nil, nodes)
			end, {3}), i(6, "body")
		}
		)),
	})
end

return {
	setup = setup
}
