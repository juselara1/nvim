local options = {noremap = true, silent=true}
local mode = 'n'
local binds = {
    {bind="<Leader>u", command=":UndotreeToggle<CR>"},
}
for _, value in pairs(binds) do
    vim.api.nvim_set_keymap(
            mode, value.bind, value.command, options
        )
end
