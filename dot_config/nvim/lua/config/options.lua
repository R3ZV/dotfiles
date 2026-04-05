vim.opt.laststatus = 3

-- Space as leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.showmode = false
vim.opt.relativenumber = true
vim.opt.undofile = true

-- Enable break indent
vim.opt.breakindent = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.termguicolors = true

vim.opt.scrolloff = 10

-- Prompt to save after failed operation
vim.opt.confirm = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.isfname:append("@-@")

vim.opt.colorcolumn = "80"

vim.opt.list = true
vim.opt.listchars = { eol = "↲", tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Use Treesitter for folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- But open all folds by default
vim.opt.foldlevel = 99

vim.opt.virtualedit = "block"

-- Highlight when yanking (copying) text
--  Try it with yap in normal mode
--  See :help vim.highlight.on_yank()
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- Autocomplete native
vim.o.autocomplete = true
vim.o.pumborder = 'rounded'
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
vim.keymap.set('n', 'sd', vim.diagnostic.open_float, { desc = "Show diagnostic error" })

vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Format on save using native LSP",
    group = vim.api.nvim_create_augroup("fmt-on-save", { clear = true }),
    callback = function(args)
        vim.lsp.buf.format({ bufnr = args.buf })
    end,
})

P = function(val)
    print(vim.inspect(val))
    return val
end
