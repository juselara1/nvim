-- leader key
vim.g.mapleader = " "

-- shortcuts
vim.keymap.set('n', "<leader>c", ":noh<CR>", {noremap = true, silent=true, desc="Clear search"})
vim.keymap.set('n', "<leader>sh", ":set list!<CR>", {noremap = true, silent=true, desc="Toggle hidden"})
vim.keymap.set('n', "<leader>p", "\"0p", {noremap = true, silent=true, desc="Paste yank"})

-- spellcheck
vim.keymap.set('n', "<leader>h", ":set spell!<CR>", {noremap = true, silent=true, desc="Spellcheck"})

-- scroll
vim.keymap.set('n', "<C-d>", "<C-d>zz", {noremap = true, silent=true, desc="Center scrolldown"})
vim.keymap.set('n', "<C-b>", "<C-b>zz", {noremap = true, silent=true, desc="Center scrollup"})
