return {
    "ramojus/mellifluous.nvim",
	config = function()
        require'mellifluous'.setup({})
        vim.cmd('colorscheme mellifluous')
	end
}
