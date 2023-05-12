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
    {bind="<Leader>tma", command=":TextBookAddCell markdown 1<CR>"},
    {bind="<Leader>tmb", command=":TextBookAddCell markdown 0<CR>"},
    {bind="<Leader>tra", command=":TextBookAddCell code 1<CR>"},
    {bind="<Leader>trb", command=":TextBookAddCell code 0<CR>"},
}

for _, value in pairs(binds) do
    vim.api.nvim_set_keymap(
            mode, value.bind, value.command, options
        )
end
