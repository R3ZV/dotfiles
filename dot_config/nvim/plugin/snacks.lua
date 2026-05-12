vim.pack.add({ 'https://github.com/folke/snacks.nvim' })

require('snacks').setup({
    rename = { enabled = true },
    bigfile = { enabled = true },
    bufdelete = { enabled = true },
    dashboard = { enabled = true },
    dim = { enabled = true },
    git = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = {
        enabled = true,
        ui_select = true,
        layout = { preset = "telescope" },
    },
    statuscolumn = { enabled = true },
    quickfile = { enabled = true },
    gitbrowse = { enabled = true },
    terminal = { enabled = true },
    toggle = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    words = { enabled = true },
})

-- Search / Pickers
vim.keymap.set("n", "<leader>sh", function() Snacks.picker.help() end, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", function() Snacks.picker.keymaps() end, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", function() Snacks.picker.files() end, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sa", function() Snacks.picker.files({ ignored = true, hidden = true }) end,
    { desc = "[S]earch [A]ll" })
vim.keymap.set("n", "<leader>sw", function() Snacks.picker.grep_word() end, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", function() Snacks.picker.grep() end, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sgd", function() Snacks.picker.diagnostics() end, { desc = "[S]earch [G]lobal [D]iagnostics" })
vim.keymap.set("n", "<leader>sld", function() Snacks.picker.diagnostics_buffer() end, { desc = "[S]earch [L]ocal [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", function() Snacks.picker.resume() end, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", function() Snacks.picker.recent() end, { desc = "[S]earch Recent Files" })
vim.keymap.set("n", "<leader><leader>", function() Snacks.picker.buffers() end, { desc = "Find buffers" })

-- LSP Utils
vim.keymap.set({ "n", "v" }, "<leader>ca", function() vim.lsp.buf.code_action() end, { desc = "[C]ode [A]ction" })
vim.keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end, { desc = "Goto Definition" })
vim.keymap.set("n", "gr", function() Snacks.picker.lsp_references() end, { desc = "Goto References" })
vim.keymap.set("n", "gD", function() Snacks.picker.lsp_declarations() end, { desc = "Goto Declaration" })
vim.keymap.set("n", "gi", function() Snacks.picker.lsp_implementations() end, { desc = "Goto Implementation" })
vim.keymap.set("n", "gt", function() Snacks.picker.lsp_type_definitions() end, { desc = "Goto Type Definition" })
vim.keymap.set("n", "gO", function() Snacks.picker.lsp_symbols() end, { desc = "Document Symbols" })
vim.keymap.set("n", "frn", function() Snacks.rename.rename_file() end, { desc = "Rename File" })
vim.keymap.set("n", "rn", function() vim.lsp.buf.rename() end, { desc = "Rename Symbol" })

-- Git
vim.keymap.set("n", "<leader>gl", function() Snacks.picker.git_log() end, { desc = "Git Log" })
vim.keymap.set("n", "<leader>gs", function() Snacks.picker.git_status() end, { desc = "Git Status" })
vim.keymap.set("n", "<leader>gb", function() Snacks.gitbrowse() end, { desc = "Open in Browser" })
vim.keymap.set("n", "<leader>fg", function() Snacks.picker.git_files() end, { desc = "Find Git Files" })
