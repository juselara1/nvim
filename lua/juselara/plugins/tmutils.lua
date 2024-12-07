return {
	"juselara1/tmutils.nvim",
	dependencies = {
        "nvim-telescope/telescope.nvim",
    },
	config = function()
		local selectors = require("tmutils.selectors")
		require("tmutils").setup {
			selector = {
				selector = selectors.telescope_selector
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
								"nix develop",
								"clear",
								"python",
							}
						end
					},
					ipython = {
						direction = "vertical",
						size = 20,
						commands = function()
							return {
								("cd %s"):format(vim.fn.getcwd()),
								"nix develop",
								"ipython",
								"clear",
							}
						end
					},
				}
			}
		}

		vim.keymap.set(
			'n', "<leader>r", ":TmutilsWindow repl<CR>",
			{
				noremap = true, silent=true,
				desc="Shows a menu to select and launch a repl"
				}
			)
		vim.keymap.set(
				{'n'}, "<leader>x", function ()
				vim.cmd("norm vix")
				local pos_l = vim.fn.getpos('.')
				local pos_r = vim.fn.getpos('v')
				vim.cmd(("%d,%dTmutilsSend"):format(pos_l[2], pos_r[2]))
				vim.api.nvim_input("<Esc>")
			end,
			{
				noremap = true, silent=false,
				desc="Sends a code cell to a tmux pane"
				}
			)
	end
}
