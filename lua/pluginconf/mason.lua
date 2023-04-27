pkgs = {"mason", "mason-lspconfig"}
for _, pkg in ipairs(pkgs) do
    status, _ = pcall(require, pkg)
    if not status then return end
end
require("mason").setup()
local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
    ensure_installed = { "lua_ls", "pyright", "bashls" }
})
