vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Debuggin
vim.keymap.set("n", "<leader>dc", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<leader>dso", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<leader>dsi", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<leader>do", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>dtb", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>dsb", ":lua require'dap'.set_breakpoing(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set(
	"n",
	"<leader>dsB",
	":lua require'dap'.set_breakpoing(nil, nil, vim.fn.input('Log point message: ')))<CR>"
)
vim.keymap.set("n", "<leader>dro", ":lua require'dap'.repl_open()<CR>")
