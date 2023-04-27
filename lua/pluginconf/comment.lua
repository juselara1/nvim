status, _ = pcall(require, "Comment")
if not status then return end
require("Comment").setup()
