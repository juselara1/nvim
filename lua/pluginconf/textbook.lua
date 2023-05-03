vim.g.TextBookTmpPath = "/tmp"
vim.g.TextBookCellIndicator = ">"
vim.g.TextBookCellPattern = "^# %% [(?P<cell_type>\\w+)]"
vim.g.TextBookCellText = " Cell: {}"
vim.g.TextBookCellColor = "\\#5180E6"
vim.g.TextBookTheme = "vim"
vim.g.TextBookCommentPattern = "^\\#"


local mode = 'n'
local options = {noremap=true, silent=true}

local binds = {
    {bind="<Leader>to", command=":TextBookOpen<CR>"},
    {bind="<Leader>ts", command=":TextBookSync<CR>"},
    {bind="<Leader>ti", command=":TextBookBuffer<CR>"},
    {bind="<Leader>tv", command=":TextBookSelectCell<CR>"},
    {bind="<Leader>tg", command=":TextBookSelectCell"},
    {bind="<Leader>tj", command=":TextBookSelectNextCell<CR>"},
    {bind="<Leader>tk", command=":TextBookSelectPrevCell<CR>"},
    {bind="<Leader>tq", command=":TextBookClose<CR>"},
}

for _, value in pairs(binds) do
    vim.api.nvim_set_keymap(
            mode, value.bind, value.command, options
        )
end
