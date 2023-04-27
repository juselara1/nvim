status, _ = pcall(require, "nvim-tree")
if not status then return end
require("nvim-tree").setup()
require("nvim-tree.view").View.winopts.relativenumber = true
