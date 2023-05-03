status, _ = pcall(require, "trevj")
if not status then return end
local trevj = require("trevj")

local options = {noremap = true, silent=true}
local mode = 'n'
local binds = {
    {bind="<Leader>j", command=trevj.format_at_cursor},
}

for _, value in pairs(binds) do
    vim.keymap.set(
            mode, value.bind, value.command, options
        )
end
