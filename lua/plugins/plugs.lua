local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data").."/site/pack/packer/opt/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim "..install_path)
    execute "packadd packer.nvim"
end

execute "packadd packer.nvim"

local packer = require("packer")
local util = require("packer.util")
packer.init({
    package_root = util.join_paths(
    fn.stdpath("data"),
    "site",
    "pack"
    ),
    git = {
        clone_timeout = 1000
    }
})

--- startup and add configure plugins
packer.startup(
function()
    use "sainnhe/everforest"
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
    use "SirVer/ultisnips"
    use "jpalardy/vim-slime"
    use "tpope/vim-surround"
    use "tpope/vim-repeat"
    use "preservim/nerdtree"
    use "AckslD/nvim-trevJ.lua"
    use {
        "akinsho/bufferline.nvim",
        requires = "kyazdani42/nvim-web-devicons"
    }
    use "neovim/nvim-lspconfig"
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/nvim-cmp"
    use "ray-x/lsp_signature.nvim"
    use "quangnguyen30192/cmp-nvim-ultisnips"
    use "mbbill/undotree"
    use "chentoast/marks.nvim"
    use {
        "stevearc/aerial.nvim",
        branch = "nvim-0.5"
    }
    use "wellle/targets.vim"
    use "numToStr/Comment.nvim"
    use "ggandor/leap.nvim"
    use "uga-rosa/ccc.nvim"
end
)
