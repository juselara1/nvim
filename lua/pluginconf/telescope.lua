pkgs = {"telescope.builtin"}

for _, pkg in ipairs(pkgs) do
    status, _ = pcall(require, pkg)
    if not status then return end
end

local builtin = require("telescope.builtin")

local options = {noremap = true, silent=true}
local mode = 'n'
local binds = {
    {bind="<Leader>b", command=builtin.buffers},
    {bind="<Leader>m", command=builtin.marks},
    {bind="<Leader>ot", command=builtin.find_files},
    {bind="<Leader>k", command=builtin.spell_suggest},
}

for _, value in pairs(binds) do
    vim.keymap.set(
            mode, value.bind, value.command, options
        )
end
