status, _ = pcall(require, "aerial")
if not status then return end

require("notify").setup({
    background_colour = "#000000",
})
