local install_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(install_path) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        install_path
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(install_path)

-- Autocommand that reloads neovim whenever you save the plugins.lua file
--vim.cmd([[
--augroup lazy_user_config
--autocmd!
--autocmd BufWritePost plugins.lua source <afile> | PackerSync
--augroup end
--]])

local plugins = {
    {
        'akinsho/bufferline.nvim',
        dependencies = {
            { 'nvim-tree/nvim-web-devicons', lazy = true },
            { 'moll/vim-bbye', lazy = false },
        },
        config = function()
            require("plugins.bufferline")
        end,
    },

    {
        "sindrets/diffview.nvim",
        dependencies = {
            { 'nvim-tree/nvim-web-devicons', lazy = true },
        },
    },

    {
        "tiagovla/scope.nvim",
        event = "VeryLazy",
        opts = {},
    },

    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
        config = function()
            require("plugins.nvim-tree")
        end,
    },

    -- colorschemes
    { 'whatyouhide/vim-gotham', lazy = true },
    { 'cocopon/iceberg.vim', lazy = true },
    { 'nordtheme/vim', lazy = true },
    { 'nyoom-engineering/oxocarbon.nvim', lazy = true },
    { 'lunarvim/colorschemes', lazy = true },
    { 'rebelot/kanagawa.nvim', lazy = true },
    { 'folke/tokyonight.nvim', lazy = true },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
        config = function()
            require("plugins.lualine")
        end,
    },

    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require("plugins.gitsigns")
        end,
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
        config = function()
            require("plugins.lsp")
        end,
    },

    -- cmp
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            require("plugins.cmp")
        end,
    },

    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("plugins.treesitter")
        end,
    },

    {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {},
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
    },

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("plugins.telescope")
        end,
    },

    {
        'tzachar/local-highlight.nvim',
        config = function()
            require("plugins.local-highlight")
        end,
    },

    {
        "numToStr/Comment.nvim",
        event = "BufReadPre",
        lazy = false,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
        config = function()
            require("plugins.comment")
        end,
    },
}

-- Use a protected call so we don't error out on first use
require("lazy").setup(plugins)

-- Have packer use a popup window
-- packer.init({
--     display = {
--         open_fn = function()
--             return require("packer.util").float({ border = "rounded" })
--         end,
--     },
-- })

-- Install your plugins here
-- return packer.startup(function(use)
--     -- My plugins here
--     use "wbthomason/packer.nvim" -- Have packer manage itself
--     use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
--     use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
-- 
--     use {
--         "akinsho/bufferline.nvim",
--         requires = {
--             {'nvim-tree/nvim-web-devicons', opt = true},
--             {'moll/vim-bbye', opt = false},
--         },
--     }
-- 
--     use 'nvim-tree/nvim-web-devicons'
--     use {
--         'nvim-tree/nvim-tree.lua',
--         requires = { 'nvim-tree/nvim-web-devicons', opt = true },
--     }
--     use {
--         'nvim-lualine/lualine.nvim',
--         requires = { 'nvim-tree/nvim-web-devicons', opt = true },
--     }
--     use {
--         'iamcco/markdown-preview.nvim',
--         run = 'cd app && npm install',
--         cmd = 'MarkdownPreview'
--     }
-- 
--     -- Colorscheme
--     use 'jaredgorski/fogbell.vim'
--     use 'whatyouhide/vim-gotham'
--     use 'cocopon/iceberg.vim'
--     use 'nordtheme/vim'
--     use 'lunarvim/colorschemes'
--     use 'rebelot/kanagawa.nvim'
--     use 'folke/tokyonight.nvim'
-- 
--     -- cmp plugins
--     use "hrsh7th/nvim-cmp" -- The completion plugin
--     use "hrsh7th/cmp-buffer" -- buffer completions
--     use "hrsh7th/cmp-path" -- path completions
--     use "hrsh7th/cmp-cmdline" -- cmdline completions
--     use "saadparwaiz1/cmp_luasnip" -- snippet completions
--     use "hrsh7th/cmp-nvim-lsp"
--     use "hrsh7th/cmp-nvim-lua"
-- 
--     -- Git
--     use "lewis6991/gitsigns.nvim"
-- 
--     -- snippets
--     use "L3MON4D3/LuaSnip" --snippet engine
--     use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
-- 
--     -- LSP
--     use {
--         "williamboman/mason.nvim",
--         "williamboman/mason-lspconfig.nvim",
--         "neovim/nvim-lspconfig",
--     }
-- 
--     -- Comment
--     use "numToStr/Comment.nvim"
--     use "JoosepAlviste/nvim-ts-context-commentstring"
-- 
--     -- Cursorline
--     use "tzachar/local-highlight.nvim"
-- 
--     -- Telescope
--     use {
--         "nvim-telescope/telescope.nvim",
--         requires = { {'nvim-lua/plenary.nvim'} },
--     }
-- 
--     -- Treesitter
--     use {
--         "nvim-treesitter/nvim-treesitter",
--         run = ":TSUpdate",
--     }
--     use "nvim-treesitter/playground"
-- 
--     -- Automatically set up your configuration after cloning packer.nvim
--     -- Put this at the end after all plugins
--     if PACKER_BOOTSTRAP then
--         require("packer").sync()
--     end
-- end)
