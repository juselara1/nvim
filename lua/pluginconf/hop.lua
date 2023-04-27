status, _ = pcall(require, "hop")
if not status then return end
local hop = require("hop")
hop.setup({keys="aoeuidhtns',.pyfgcrl"})

local options = {noremap = true, silent=true}
local mode = 'n'
local binds = {
    {bind="<Leader>l", command=":HopLine<CR>"},
}
for _, value in pairs(binds) do
    vim.api.nvim_set_keymap(
            mode, value.bind, value.command, options
        )
end
