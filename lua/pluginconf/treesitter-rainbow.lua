status, _ = pcall(require, "nvim-treesitter")
if not status then return end
require("nvim-treesitter.configs").setup({})
