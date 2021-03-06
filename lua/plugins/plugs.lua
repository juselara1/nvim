local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data").."/site/pack/packer/opt/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim "..install_path)
    execute "packadd packer.nvim"
end

vim.cmd("packadd packer.nvim")

local packer = require("packer")
local util = require("packer.util")
packer.init({
    package_root = util.join_paths(
    fn.stdpath("data"),
    "site",
    "pack"
    ),
    git = {
        clone_timeout = 600
    }
})

--- startup and add configure plugins
packer.startup(
function()
    use "sainnhe/gruvbox-material"
    use "nvim-treesitter/nvim-treesitter"
    use "nvim-treesitter/playground"
    use "romgrk/nvim-treesitter-context"
    use "p00f/nvim-ts-rainbow"
    use "christoomey/vim-tmux-navigator"
    use {
        "hoob3rt/lualine.nvim",
        requires={"kyazdani42/nvim-web-devicons", opt=true}
    }
    use "tpope/vim-fugitive"
    use "psliwka/vim-smoothie"
    use {
        "phaazon/hop.nvim",
        as = "hop"
    }
    use "SirVer/ultisnips"
    use "jpalardy/vim-slime"
    use "tpope/vim-surround"
    use "tpope/vim-repeat"
    use "cespare/vim-toml"
    use "preservim/nerdtree"
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            {
                "nvim-lua/plenary.nvim"
            }
        }
    }
    use "tversteeg/registers.nvim"
    use {
        "AckslD/nvim-revJ.lua",
        requires = {"kana/vim-textobj-user", "sgur/vim-textobj-parameter"},
    }
    use "github/copilot.vim"
    use {
        "akinsho/bufferline.nvim",
        requires = "kyazdani42/nvim-web-devicons"
    }
    use {
        "folke/twilight.nvim",
        config = function() require("twilight").setup {} end
    }
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/nvim-cmp"
    use "quangnguyen30192/cmp-nvim-ultisnips"
    use "mbbill/undotree"
end
)
