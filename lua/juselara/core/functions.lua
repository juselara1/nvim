return {
	bind = function (mode, keys, command, desc)
		vim.keymap.set(
		mode, keys, command, {noremap = true, silent=true, desc=desc}
		)
	end
}
