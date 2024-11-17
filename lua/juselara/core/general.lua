vim.o.number = true
vim.o.updatetime = 100
vim.o.mouse = ""
vim.o.numberwidth = 1
vim.o.clipboard = "unnamedplus"
vim.o.showcmd = true
vim.o.ruler = true
vim.o.showmatch = true
vim.o.encoding = "utf-8"
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.relativenumber = true
vim.o.laststatus = 2
vim.o.showmode = true
vim.o.spelllang = "en,es"
vim.o.list = false
vim.o.background = "dark"
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.termguicolors = true
vim.o.swapfile = false
vim.o.backupcopy = "yes"
vim.o.statuscolumn = "%s %l %r "
vim.cmd.syntax "enable"

--vim.api.nvim_exec("syntax enable", false)

-- highlight yanked text
vim.cmd [[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=400})
augroup END
]]

-- netrw config
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 20
vim.g.netrw_bufsettings = "noma nomod nu nobl nowrap ro"
