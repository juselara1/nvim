vim.g.mapleader = " "

bind = function(
    mode, keys, command
    )
    vim.api.nvim_set_keymap(
    mode, keys, command,
    {noremap = true, silent=true}
    )
end

-- shortcuts
bind('n', "<Leader>c", ":noh<CR>") --clear search
bind('n', "<Leader>e", ":e .<CR>") --file navigator
bind('n', "<Leader>sh", ":set list!<CR>") --toggle hidden characters
bind('n', "<Leader>p", "\"0p") --paste from yank buffer

-- spellcheck
bind('n', "<Leader>h", ":set spell!<CR>")

--rebinds
bind('n', "<C-d>", "<C-d>zz")
bind('n', "<C-b>", "<C-b>zz")
