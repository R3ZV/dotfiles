vim.o.background = "dark"
require("gruvbox").setup({
    palette_overrides = {
        dark0 = "#101010",
        dark1 = "#101010",
    }
})

vim.cmd.colorscheme("gruvbox")
vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg="black", bg="#252525" })
