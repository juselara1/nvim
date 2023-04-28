vim.g.slime_target = "tmux"
vim.g.slime_paste_file = vim.fn.expand("$HOME/.slime_paste")

local delimiters = {
    python = "# %%", sh = "# %%", julia = "# %%", r = "# %%", javascript = "// %%",
    lua = "-- %%", haskell="-- %%", lisp = ";; %%"
}

local ft = vim.bo.filetype
vim.g.slime_cell_delimiter = delimiters[ft]
