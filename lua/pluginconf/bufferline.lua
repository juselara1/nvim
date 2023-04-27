status, _ = pcall(require, "bufferline")
if not status then return end
require("bufferline").setup{}
