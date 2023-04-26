local options = {noremap = true, silent=true}
local mode = 'n'
local binds = {
    {bind="gd", command=":lua vim.lsp.buf.declaration()<CR>"},
    {bind="gi", command=":lua vim.lsp.buf.implementation()<CR>"},
    {bind="gh", command=":lua vim.lsp.buf.hover()<CR>"},
    {bind="gs", command=":lua vim.lsp.buf.signature_help()<CR>"},
    {bind="grf", command=":lua vim.lsp.buf.rename()<CR>"},
    {bind="grn", command=":lua vim.lsp.buf.references()<CR>"},
    {bind="gn", command=":lua vim.diagnostic.goto_prev({border = 'rounded'})<CR>"},
    {bind="gN", command=":lua vim.diagnostic.goto_next({border = 'rounded'})<CR>"},
    {bind="gl", command=":lua vim.diagnostic.show_line_diagnostics({border = 'rounded'})<CR>"}
}
for _, value in pairs(binds) do
    vim.api.nvim_set_keymap(
            mode, value.bind, value.command, options
        )
end
