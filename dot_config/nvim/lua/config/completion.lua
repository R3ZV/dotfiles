-- Autocomplete native
vim.o.autocomplete = true
vim.o.pumborder = "rounded"
vim.o.pummaxwidth = 40
vim.o.pumblend = 10
vim.o.pumheight = 5
vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client and client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, args.buf, {
                autotrigger = true
            })
        end
    end,
})

vim.api.nvim_create_autocmd("BufEnter", {
    desc = "Disable autocomplete in UI, prompt, and terminal buffers",
    callback = function(args)
        -- If the buftype is not empty (e.g., 'nofile', 'prompt'), disable autocomplete
        vim.bo[args.buf].autocomplete = (vim.bo[args.buf].buftype == "")
    end,
})
vim.diagnostic.config({
    virtual_text = {
        spacing = 4,
        prefix = '●',
    },
    signs = true,
    underline = true,
    update_in_insert = false,
})
vim.keymap.set("n", "<leader>md", vim.diagnostic.open_float, { desc = "Show diagnostic error" })
vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format)

vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Format on save using native LSP",
    group = vim.api.nvim_create_augroup("fmt-on-save", { clear = true }),
    callback = function(args)
        vim.lsp.buf.format({ bufnr = args.buf })
    end,
})
