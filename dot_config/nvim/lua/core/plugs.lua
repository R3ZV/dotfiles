local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- Autoformat
    { "stevearc/conform.nvim" },

    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    { "ellisonleao/gruvbox.nvim" },

    -- Fuzzy Finder (files, lsp, etc)
    {
        "nvim-telescope/telescope.nvim",
        event = "VeryLazy",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { -- If encountering errors, see telescope-fzf-native README for install instructions
                "nvim-telescope/telescope-fzf-native.nvim",

                -- `build` is used to run some command when the plugin is installed/updated.
                -- This is only run then, not every time Neovim starts up.
                build = "make",

                -- `cond` is a condition used to determine whether this plugin should be
                -- installed and loaded.
                cond = function()
                    return vim.fn.executable("make") == 1
                end,
            },
            { "nvim-telescope/telescope-ui-select.nvim" },

            -- Useful for getting pretty icons, but requires special font.
            --  If you already have a Nerd Font, or terminal set up with fallback fonts
            --  you can enable this
            { "nvim-tree/nvim-web-devicons" },
        },
    },

    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } },
    },

    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
        },
    },

    -- Highlight todo, notes, etc in comments
    { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }, opts = { signs = false } },

        -- Collection of various small independent plugins/modules
    { "echasnovski/mini.nvim" },

    -- debugging
    { "mfussenegger/nvim-dap" },
    { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },

     -- LSP Plugins
    {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
          library = {
            -- Load luvit types when the `vim.uv` word is found
            { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
          },
        },
    },

    {
        -- Main LSP Configuration
        'neovim/nvim-lspconfig',
        dependencies = {
          -- Automatically install LSPs and related tools to stdpath for Neovim
          -- Mason must be loaded before its dependents so we need to set it up here.
          -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
            { 'williamboman/mason.nvim', opts = {} },
          'williamboman/mason-lspconfig.nvim',
          'WhoIsSethDaniel/mason-tool-installer.nvim',

          -- Allows extra capabilities provided by blink.cmp
          'saghen/blink.cmp',
        },
    },

    {
        'saghen/blink.cmp',
        event = 'VimEnter',
        version = '1.*',
        dependencies = {
          {
            'L3MON4D3/LuaSnip',
            version = '2.*',
          },
          'folke/lazydev.nvim',
        },
    },
}

local opts = {}

require("lazy").setup(plugins, opts)
