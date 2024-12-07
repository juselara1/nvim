return {
	"juselara1/tmutils.nvim",
	dependencies = {
        "nvim-telescope/telescope.nvim",
    },
	keys = {
		{
			"<leader>tc",
			desc = "Setups the Tmutils pane."
		},
		{
			"<leader>ta",
			desc = "Captures the content of a Tmutils pane."
		},
		{
			"<leader>tt",
			desc = "Launches a Tmutils terminal."
		},
		{
			"<leader>tr",
			desc = "Shows a menu to select and launch a Tmutils repl."
		},
		{
			"<leader>td",
			desc = "Deletes the configured Tmutils pane."
		},
		{
			"<leader>tx",
			desc = "Sends a code cell to a Tmutils pane."
		}
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
			'n', "<leader>tc", ":TmutilsConfig<CR>",
			{
				noremap = true, silent=true,
				desc="Setups the Tmutils pane."
				}
			)
		vim.keymap.set(
			'n', "<leader>ta", ":TmutilsCapture newbuffer<CR>",
			{
				noremap = true, silent=true,
				desc="Captures the content of a Tmutils pane."
				}
			)
		vim.keymap.set(
			'n', "<leader>tt", ":TmutilsWindow terminal<CR>",
			{
				noremap = true, silent=true,
				desc="Launches a Tmutils terminal."
				}
			)
		vim.keymap.set(
			'n', "<leader>tr", ":TmutilsWindow repl<CR>",
			{
				noremap = true, silent=true,
				desc="Shows a menu to select and launch a Tmutils repl."
				}
			)
		vim.keymap.set(
			'n', "<leader>td", ":TmutilsWindow delete<CR>",
			{
				noremap = true, silent=true,
				desc="Deletes the configured Tmutils pane."
				}
			)
		vim.keymap.set(
			'n', "<leader>tx", function ()
				vim.cmd("norm vix")
				local pos_l = vim.fn.getpos('.')
				local pos_r = vim.fn.getpos('v')
				vim.cmd(("%d,%dTmutilsSend"):format(pos_l[2], pos_r[2]))
				vim.api.nvim_input("<Esc>")
			end,
			{
				noremap = true, silent=false,
				desc="Sends a code cell to a Tmutils pane."
				}
			)
		vim.keymap.set(
			'v', "<leader>ts", ":TmutilsSend<CR>",
			{
				noremap = true, silent=false,
				desc="Sends a visual selection to a Tmutils pane."
				}
			)
	end
}
