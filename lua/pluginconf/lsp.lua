local options = {noremap = true, silent=true}
local mode = 'n'
local binds = {
    {bind="gd", command=vim.lsp.buf.declaration},
    {bind="gi", command=vim.lsp.buf.implementation},
    {bind="gh", command=vim.lsp.buf.hover},
    {bind="gs", command=vim.lsp.buf.signature_help},
    {bind="grf", command=vim.lsp.buf.rename},
    {bind="grn", command=vim.lsp.buf.references},
    {bind="gn", command=function () return vim.diagnostic.goto_prev({border = "rounded"}) end},
    {bind="gN", command=function () return vim.diagnostic.goto_next({border = "rounded"}) end},
    {bind="gl", command=function () return vim.diagnostic.show_line_diagnostics({border = "rounded"}) end}
}
for _, value in pairs(binds) do
    vim.keymap.set(
            mode, value.bind, value.command, options
        )
end