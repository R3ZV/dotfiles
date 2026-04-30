vim.pack.add({
    'https://github.com/ellisonleao/gruvbox.nvim',
    'https://github.com/stevearc/oil.nvim',
    'https://github.com/nvim-mini/mini.icons',
    'https://github.com/lewis6991/gitsigns.nvim',
})

require('gruvbox').setup({
    transparent_mode = true,
    palette_overrides = {
        dark0 = "#101010",
        dark1 = "#101010",
    },
    overrides = {
        Comment = { fg = "#b8bb26" },
    }
})

vim.o.background = "dark"
vim.cmd.colorscheme("gruvbox")

vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg = "black", bg = "#252525" })
vim.api.nvim_set_hl(0, "SnacksPickerListCursorLine", { fg = "#FABD2F", bg = "#3C3836", bold = true })
vim.api.nvim_set_hl(0, "SnacksPickerMatch", { fg = "#FB4934", bold = true })

require('oil').setup()
require('mini.icons').setup()
require('gitsigns').setup({
    current_line_blame = true
})
