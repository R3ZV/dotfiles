function ColorVim()
    -- color = color or "gruvbox"
    vim.o.bg = "dark"
    vim.cmd.colorscheme("gruber-darker")

    -- vim.cmd.colorscheme(color)

    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end
ColorVim()
