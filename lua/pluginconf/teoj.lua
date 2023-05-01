status, _ = pcall(require, "teoj")
if not status then return end
local teoj = require("teoj")
local options = {noremap = true, silent=true}
binds = {
    {mode = {'v', 'o'}, bind="ice", command=function () teoj.object("^# %%%%.*$", "^# %%%%.*$", false, false) end}, -- jupytext cell
    {mode = {'v', 'o'}, bind="ace", command=function () teoj.object("^# %%%%.*$", "^# %%%%.*$", true, false) end}, -- jupytext cell
    {mode = {'v', 'o'}, bind="imh1", command=function () teoj.object("^# .+$", "^# .+$", false, false) end}, -- markdown h1
    {mode = {'v', 'o'}, bind="amh1", command=function () teoj.object("^# .+$", "^# .+$", true, false) end}, -- markdown h1
    {mode = {'v', 'o'}, bind="imh2", command=function () teoj.object("^## .+$", "^##? .+$", false, false) end}, -- markdown h2
    {mode = {'v', 'o'}, bind="amh2", command=function () teoj.object("^## .+$", "^##? .+$", true, false) end}, -- markdown h2
    {mode = {'v', 'o'}, bind="imh3", command=function () teoj.object("^### .+$", "^##?#? .+$", false, false) end}, -- markdown h3
    {mode = {'v', 'o'}, bind="amh3", command=function () teoj.object("^### .+$", "^##?#? .+$", true, false) end}, -- markdown h3
    {mode = {'v', 'o'}, bind="i,", command=function () teoj.object("%,", "%,", false, false) end}, -- comma
    {mode = {'v', 'o'}, bind="a,", command=function () teoj.object("%,", "%,", true, true) end}, -- comma
    {mode = {'v', 'o'}, bind="i.", command=function () teoj.object("%.", "%.", false, false) end}, -- dot
    {mode = {'v', 'o'}, bind="a.", command=function () teoj.object("%.", "%.", true, true) end}, -- dot
    {mode = {'v', 'o'}, bind="i;", command=function () teoj.object("%;", "%;", false, false) end}, -- dot
    {mode = {'v', 'o'}, bind="a;", command=function () teoj.object("%;", "%;", true, true) end}, -- dot
}

for _, bind in ipairs(binds) do
    vim.keymap.set(bind.mode, bind.bind, bind.command, options)
end
