local options = {noremap = true, silent=true}
local mode = 'n'
local binds = {
    {bind="<Leader>gs", command=":Git<CR>"},
    {bind="<Leader>gc", command=":Git commit<CR>"},
    {bind="<Leader>gd", command=":Git diff<CR>"},
    {bind="<Leader>gh", command=":diffget //3<CR>"},
    {bind="<Leader>gu", command=":diffget //2<CR>"}
}
for _, value in pairs(binds) do
    vim.api.nvim_set_keymap(
            mode, value.bind, value.command, options
        )
end
