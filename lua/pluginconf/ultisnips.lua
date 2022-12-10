vim.g.UltiSnipsEditSplit = "vertical"
vim.g.UltiSnipsListSnippets = "<C-g>"
vim.g.UltiSnipsJumpForwardTrigger = "<C-n>"
vim.g.UltiSnipsJumpBackwardTrigger = "<C-s>"
vim.g.UltiSnipsUsePythonVersion = 3
vim.g.UltiSnipsSnippetDirectories = {os.getenv("CONF_FILES").."/snippets"}
vim.g.UltiSnipsSnippetsDir = os.getenv("CONF_FILES")

