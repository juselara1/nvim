vim.g.slime_target = "tmux"
vim.g.slime_paste_file = vim.fn.expand("$HOME/.slime_paste")

local delimiters = {
    python = "# %%", sh = "# %%", julia = "# %%", r = "# %%", javascript = "// %%",
    lua = "-- %%", haskell="-- %%", lisp = ";; %%"
}

local ft = vim.bo.filetype
vim.g.slime_cell_delimiter = delimiters[ft]

local options = {noremap = true, silent=true}
local mode = 'n'
local binds = {
    {bind="<Leader>r", command=":call slime#send_cell()<CR>"},
    {bind="<Leader>l", command=":SlimeSendCurrentLine<CR>"},
}
for _, value in pairs(binds) do
    vim.api.nvim_set_keymap(
            mode, value.bind, value.command, options
        )
end
