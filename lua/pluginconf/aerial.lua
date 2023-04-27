status, _ = pcall(require, "aerial")
if not status then return end
require("aerial").setup({
    backends = { "treesitter", "lsp", "markdown", "man" },
    default_direction = "float",
    placement = "window"
})

local options = {noremap = true, silent=true}
local mode = 'n'
local binds = {
    {bind="<Leader>a", command=":AerialToggle<CR>"},
}
for _, value in pairs(binds) do
    vim.api.nvim_set_keymap(
            mode, value.bind, value.command, options
        )
end
