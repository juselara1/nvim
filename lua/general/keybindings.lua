vim.g.mapleader = " "

local bind = function(
    mode, keys, command
    )
    vim.api.nvim_set_keymap(
	mode, keys, command,
	{noremap = true, silent=true}
	)
end

-- fugitive
bind('n', "<Leader>gs", ":Git<CR>")
bind('n', "<Leader>gc", ":Git commit<CR>")
bind('n', "<Leader>gp", ":Git push<CR>")
bind('n', "<Leader>gd", ":Git diff<CR>")
bind('n', "<Leader>gpl", ":Git pull<CR>")
bind('n', "<Leader>gh", ":diffget //3<CR>")
bind('n', "<Leader>gu", ":diffget //2<CR>")

-- coc
bind('n', "gd", ":call CocAction('jumpDefinition', '')<CR>")
bind('n', "gy", ":call CocAction('jumpTypeDefinition')<CR>")
bind('n', "gi", ":call CocAction('jumpImplementation')<CR>")
bind('n', "gr", ":call CocAction('doHover')<CR>")

-- hop
bind('n', "<Leader>l", ":HopLine<CR>")
bind('n', "<Leader>w", ":HopWord<CR>")
bind('n', "<Leader>s", ":HopChar2<CR>")

-- vim-slime
bind('n', "<Leader>r", ":call slime#send_cell()<CR>")

-- shortcuts
bind('n', "<Leader>p", ":reg<CR>") --registers
bind('n', "<Leader>c", ":noh<CR>") --clear search
bind('n', "<Leader>e", ":e .<CR>") --file navigator
bind('n', "<Leader>a", ":set list!<CR>") --toggle hidden characters

-- spellcheck
bind('n', "<Leader>h", ":set spell!<CR>")
bind('n', "<Leader>t", "1z=")

--nerdtree
bind('n', "<Leader>o", ":NERDTreeToggle<CR>")

--telescope
bind('n', "<Leader>b", ":Telescope buffers<CR>")
bind('n', "<Leader>fl", ":Telescope live_grep<CR>")
bind('n', "<Leader>ff", ":Telescope find_files<CR>")

--registers
bind('n', "<Leader>p", ":Registers<CR>")
