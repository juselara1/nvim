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

-- lsp
bind('n', "gd", ":lua vim.lsp.buf.declaration()<CR>")
bind('n', "gi", ":lua vim.lsp.buf.implementation()<CR>")
bind('n', "gh", ":lua vim.lsp.buf.hover()<CR>")
bind('n', "gs", ":lua vim.lsp.buf.signature_help()<CR>")
bind('n', "grf", ":lua vim.lsp.buf.references()<CR>")
bind('n', "grn", ":lua vim.lsp.buf.rename()<CR>")
bind('n', "gn", ":lua vim.diagnostic.goto_prev({border = 'rounded'})<CR>")
bind('n', "gN", ":lua vim.diagnostic.goto_next({border = 'rounded'})<CR>")
bind('n', "gl", ":lua vim.diagnostic.show_line_diagnostics({border = 'rounded'})<CR>")

-- hop
bind('n', "<Leader>l", ":HopLine<CR>")
bind('n', "<Leader>w", ":HopWord<CR>")
bind('n', "<Leader>s", ":HopChar2<CR>")

-- vim-slime
bind('n', "<Leader>r", ":call slime#send_cell()<CR>")

-- shortcuts
bind('n', "<Leader>c", ":noh<CR>") --clear search
bind('n', "<Leader>e", ":e .<CR>") --file navigator
bind('n', "<Leader>a", ":set list!<CR>") --toggle hidden characters
bind('n', "<Leader>p", "\"0p") --paste from yank buffer

-- spellcheck
bind('n', "<Leader>h", ":set spell!<CR>")
bind('n', "<Leader>t", "1z=")

--nerdtree
bind('n', "<Leader>o", ":NERDTreeToggle<CR>")

--undotree
bind('n', "<Leader>u", ":UndotreeToggle<CR>")

--aerial
bind('n', "<Leader>a", ":AerialToggle<CR>")

--rebinds
bind('n', "<C-d>", "<C-d>zz")
bind('n', "<C-b>", "<C-b>zz")
