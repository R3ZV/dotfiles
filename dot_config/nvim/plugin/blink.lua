vim.pack.add({ 'https://github.com/saghen/blink.lib', 'https://github.com/saghen/blink.cmp' })

local cmp = require('blink.cmp')
cmp.build():wait(60000)
cmp.setup({
    completion = {
        menu = {
            auto_show = false,
        },
        ghost_text = {
            enabled = true,
        },
        list = {
            selection = {
                auto_insert = false
            }
        },
    },

    keymap = {
        ['<C-n>'] = {
            function(cmpp)
                return cmpp.select_next({ on_ghost_text = true })
            end,
            'fallback'
        },
        ['<C-p>'] = {
            function(cmpp)
                return cmpp.select_prev({ on_ghost_text = true })
            end,
            'fallback'
        },
    },
})

vim.diagnostic.config({
  virtual_text = false, -- Hides the inline diagnostic text
  signs = false,        -- Hides the gutter signs (E, W, etc.)
  underline = false,    -- Removes the squiggly lines under code
  float = false,        -- Disables hover popups for diagnostics
  update_in_insert = false,
})

vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Show diagnostic error" })
vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format)
