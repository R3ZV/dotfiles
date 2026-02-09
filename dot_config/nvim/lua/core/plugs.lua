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
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            bigfile = { enabled = true },
            quickfile = { enabled = true },
            bufdelete = { enabled = true },
            input = { enabled = true },
            indent = { enabled = true },
            rename = { enabled = true },
            lazygit = { enabled = true },
            dim = { enabled = true },
            scroll = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
            terminal = { enable = true },
            picker = {
                enabled = true,
                ui_select = true,
                layout = {
                    preset = "default",
                }
            },
            dashboard = { enabled = true },
            notifier = { enabled = true },
        },
        keys = {
            { "<leader>sh",       function() Snacks.picker.help() end,            desc = "[S]earch [H]elp" },
            { "<leader>sk",       function() Snacks.picker.keymaps() end,         desc = "[S]earch [K]eymaps" },
            { "<leader>sf",       function() Snacks.picker.files() end,           desc = "[S]earch [F]iles" },
            { "<leader>ss",       function() Snacks.picker.pickers() end,         desc = "[S]earch [S]elect Picker" },
            { "<leader>sw",       function() Snacks.picker.grep_word() end,       desc = "[S]earch current [W]ord" },
            { "<leader>sg",       function() Snacks.picker.grep() end,            desc = "[S]earch by [G]rep" },
            { "<leader>sd",       function() Snacks.picker.diagnostics() end,     desc = "[S]earch [D]iagnostics" },
            { "<leader>sr",       function() Snacks.picker.resume() end,          desc = "[S]earch [R]esume" },
            { "<leader>s.",       function() Snacks.picker.recent() end,          desc = '[S]earch Recent Files ("." for repeat)' },
            { "<leader><leader>", function() Snacks.picker.buffers() end,         desc = "[ ] Find existing buffers" },
            { "<leader>u",        function() Snacks.picker.undo() end,            desc = "Undo History" },

            -- GIT
            { "<leader>gl",       function() Snacks.picker.git_log() end,         desc = "Git Log" },
            { "<leader>gL",       function() Snacks.picker.git_log_file() end,    desc = "Git Log (Current File)" },
            { "<leader>gs",       function() Snacks.picker.git_status() end,      desc = "Git Status (Stage/Unstage)" },

            -- VIM MEMORY
            { '<leader>"',        function() Snacks.picker.registers() end,       desc = "Registers" },
            { "<leader>j",        function() Snacks.picker.jumps() end,           desc = "Jumps" },
            { "<leader>m",        function() Snacks.picker.marks() end,           desc = "Marks" },

            -- SEARCH INSIDE BUFFER
            { "<leader>/",        function() Snacks.picker.lines() end,           desc = "Search Buffer Lines" },

            -- CONFIG & HELP
            { "<leader>:",        function() Snacks.picker.command_history() end, desc = "Command History" },
            { "<leader>n",        function() Snacks.picker.notifications() end,   desc = "Notification History" },
            { "<c-/>", function() Snacks.terminal() end, desc = "Toggle Terminal" },
        },
    },

    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { { "nvim-mini/mini.icons", opts = {} } },
        lazy = false,
    },
    {
        "mason-org/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        }
    },
    {
        "saghen/blink.cmp",
        dependencies = { "rafamadriz/friendly-snippets" },
        version = "1.*",
        opts = {
            keymap = { preset = "default" },
            appearance = {
                nerd_font_variant = "mono",
            },
            completion = { documentation = { auto_show = false } },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
            fuzzy = { implementation = "prefer_rust_with_warning" },
        },
        opts_extend = { "sources.default" },
    },

    {
        'neovim/nvim-lspconfig',
        dependencies = { 'saghen/blink.cmp' },

        opts = {
            servers = {
                lua_ls = {},
                rust_analyzer = {},
                pyright = {},
                alex = {},
                clangd = {},
                gopls = {},
                zls = {},
                ruff = {},
                autopep8 = {},
                refurb = {},
                sourcery = {},
            }
        },
        config = function(_, opts)
        vim.lsp.config('*', {
            capabilities = require('blink.cmp').get_lsp_capabilities()
        })

        for server, server_opts in pairs(opts.servers) do
            vim.lsp.config(server, server_opts)
            vim.lsp.enable(server)
        end
    end
    },

    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "ellisonleao/gruvbox.nvim" },
    {
        "stevearc/conform.nvim",
        notify_on_error = false,
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = false,
        },
    },
}

local opts = {}

require("lazy").setup(plugins, opts)
