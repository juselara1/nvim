local trevj = require("trevj")

vim.keymap.set(
    'n',
    "<leader>j",
    function()
        trevj.format_at_cursor()
    end
)
