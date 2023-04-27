pkgs = {"cmp", "cmp_nvim_lsp", "lspconfig"}
for _, pkg in ipairs(pkgs) do
    status, _ = pcall(require, pkg)
    if not status then return end
end
local cmp = require("cmp")

cmp.setup({
    snippet = {},
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
    }, {
        { name = 'buffer' },
    })
})

cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' },
    }, {
        { name = 'buffer' },
    })
})

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local lsp_servers = {
    "ansiblels", "bashls", "clangd", "cmake",
    "dockerls", "elixirls", "eslint", "gopls",
    "hls", "html", "jsonls", "pyright",
    "rust_analyzer", "taplo", "zk",
}
for _, lsp_server in ipairs(lsp_servers) do
    require("lspconfig")[lsp_server].setup {
        capabilities = capabilities
    }
end
