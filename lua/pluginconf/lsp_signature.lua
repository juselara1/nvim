status, _ = pcall(require, "lsp_signature")
if not status then return end
require("lsp_signature").setup({
    bind = true,
    handler_opts = {
      border = "rounded"
    }
  })
