local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data").."/site/pack/packer/opt/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim "..install_path)
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

packer.startup(
function()
    use "sainnhe/everforest"
    use "nvim-treesitter/nvim-treesitter"
    use "nvim-treesitter/playground"
    use "romgrk/nvim-treesitter-context"
    use "christoomey/vim-tmux-navigator"
    use "kyazdani42/nvim-web-devicons"
    use "hoob3rt/lualine.nvim"
    use "tpope/vim-fugitive"
    use "jpalardy/vim-slime"
    use "tpope/vim-surround"
    use "AckslD/nvim-trevJ.lua"
    use "akinsho/bufferline.nvim"
    use "neovim/nvim-lspconfig"
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/nvim-cmp"
    use "ray-x/lsp_signature.nvim"
    use "mbbill/undotree"
    use "stevearc/aerial.nvim"
    use "numToStr/Comment.nvim"
    use "uga-rosa/ccc.nvim"
    use "nvim-tree/nvim-tree.lua"
    use {"phaazon/hop.nvim", branch = "v2"}
    use "norcalli/nvim-colorizer.lua"
    use 'kdheepak/JuliaFormatter.vim'
    use "juselara1/teoj.nvim"
    use {"juselara1/textbook.nvim", run = ":UpdateRemotePlugins"}
    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.1",
        requires = { {"nvim-lua/plenary.nvim"} },
    }
end
)
