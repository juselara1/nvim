return {
	"juselara1/tmutils.nvim",
	dependencies = {"nvim-telescope/telescope.nvim"},
	config = function()
		require("tmutils").setup {
			selector = {
				selector = "telescope"
			},
			window = {
				terminal = {
                    direction = "vertical",
                    size = 20,
					commands = function()
						return {
							("cd %s"):format(vim.fn.getcwd()),
							"clear"
						}
					end
                },
				repls = {
					python = {
						direction = "vertical",
						size = 20,
						commands = function()
							return {
								("cd %s"):format(vim.fn.getcwd()),
								"clear",
								"python",
							}
						end
					},
				}
			}
		}
	end
}
