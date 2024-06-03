
local function setup ()
	local ls = require("luasnip")
	local fmt = require("luasnip.extras.fmt").fmt
	local fmta = require("luasnip.extras.fmt").fmta
	local s = ls.snippet
	local sn = ls.snippet_node
	local i = ls.insert_node
	local t = ls.text_node
	local c = ls.choice_node
	local f = ls.function_node
	local d = ls.dynamic_node
	local function nl() return t{"", ""} end

	--- Generates docstring for function's parameters.
	---@param params {name: string, type: string}[]
	---@return any
	local function docstring_params(params)
		local nodes = {}
		for idx, param in ipairs(params) do
			table.insert(nodes, nl())
			table.insert(nodes, t"\t")
			table.insert(nodes, t(string.format(":param %s: ", param.name)))
			table.insert(nodes, i(idx, "pdoc"))
			table.insert(nodes, nl())
			table.insert(nodes, t"\t")
			table.insert(nodes, t(string.format(":type %s: %s", param.name, param.type)))
		end
		return sn(nil, nodes)
	end

	---Obtains treesitter function's parameters.
	---@return {name: string, type: string}[] | nil
	local function get_ts_params()
		local function_types = {
			function_definition = true,
			method_definition = true,
			func_literal = true,
		}
		local node = vim.treesitter.get_node()
		while node ~= nil do
			if function_types[node:type()] then
				break
			else
				node = node:parent()
			end
		end
		if node == nil then
			return nil
		end
		local query1 = vim.treesitter.query.get("python", "get-fn-pnames")
		local query2 = vim.treesitter.query.get("python", "get-fn-ptypes")
		if query1 and query2 then
			local pnames = {}
			for _, capture, _ in query1:iter_captures(node, 0) do
				table.insert(pnames, vim.treesitter.get_node_text(capture, 0))
			end
			vim.print(pnames)

			local ptypes = {}
			for _, capture, _ in query2:iter_captures(node, 0) do
				table.insert(ptypes, vim.treesitter.get_node_text(capture, 0))
			end

			local typed_params = {}
			for idx=1,#pnames do
				table.insert(typed_params, {name=pnames[idx], type=ptypes[idx]})
			end
			return typed_params
		end
	end
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
		s("@fn", fmta(
		[[
		def <name>(<params>) ->> <rtype>:
			"""
			<docstring>
		<doc_params>
			:returns: <rdoc>
			:rtype: <rtype2>
			"""
			<body>
		]], {
			name=i(1, "name"), params=i(2, ""), rtype=i(3, "rtype"),
			docstring=i(4, "docstring"),
			doc_params=d(5, function(_)
				local params = get_ts_params()
				if params then
					return docstring_params(params)
				else
					return sn(nil, t'')
				end
			end, {2}),
			rdoc=i(6, "rdoc"), rtype2=f(function (args) return args[1][1] end, {3}),
			body=i(7, "...")
		}
		)),
		-- Define class
		s("@class", fmta(
		[[
		class <name>(<super>):
			"""
			<docstring>
		<doc_params>
			"""
			<params>

			<body>
		]], {
			name=i(1, "name"), super=i(2, ""), docstring=i(3, "docstring"),
			doc_params=d(5, function(args)
				if args[1][1] == '' then
					return sn(nil, t"")
				end
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
			end, {4}), params=i(4, ""), body=i(6, "...")
		}
		)),
		-- Method
		s("@method", fmt(
		[[
		def {}(self, {}) -> {}:
			"""
			{}
		{}
			:returns: {}
			:rtype: {}
			"""
			{}
		]], {
			i(1, "mname"), i(2, ""), i(3, "rtype"), i(4, "docstring"),
			d(5, function(args)
				local params_str = args[1][1]:gsub(" ", "")
				if params_str == '' then
					return sn(nil, t'')
				end
				local params = vim.split(params_str, ',')
				return docstring_params(params)
			end, {2}),
			i(6, "rdoc"), f(function(args) return args[1][1] end, {3}),
			i(7, "...")
		}
		)),
		-- Init method
		s("@imethod", fmt(
		[[
		def __init__(self, {}):
		{}
		{}
		]], {
			i(1, ""),
			f(function(args)
				local params_str = args[1][1]:gsub(" ", "")
				if params_str == '' then
					return '\t'
				end
				local params = vim.split(params_str, ',')
				local strs = {}
				for _, param_str in ipairs(params) do
					local param = vim.split(param_str, ':')
					table.insert(strs, string.format("\tself.%s = %s", param[1], param[1]))
				end
				return strs
			end, {1}),
			nl()
		}
		)),
	})
end

return {
	setup = setup
}
