status, _ = pcall(require, "nvim-tree")
if not status then return end
require("nvim-tree").setup()
require("nvim-tree.view").View.winopts.relativenumber = true

local options = {noremap = true, silent=true}
local mode = 'n'
local binds = {
    {bind="<Leader>oo", command=":NvimTreeToggle<CR>"},
}
for _, value in pairs(binds) do
    vim.api.nvim_set_keymap(
            mode, value.bind, value.command, options
        )
end
