local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>fs", builtin.find_files, { desc = "Telescope [F]ile [S]earch" })
vim.keymap.set("n", "<leader>gs", builtin.live_grep, { desc = "Telescope [G]rep [S]earch" })
vim.keymap.set("n", "<leader>bs", builtin.buffers, { desc = "Telescope [B]uffer [S]earch" })
vim.keymap.set("n", "<leader>hs", builtin.help_tags, { desc = "Telescope [H]elp tag [S]earch" })
