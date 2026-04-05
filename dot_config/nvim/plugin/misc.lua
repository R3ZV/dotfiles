vim.pack.add({
    'https://github.com/nvim-mini/mini.pairs',
    'https://github.com/nvim-mini/mini.surround',
    'https://github.com/nvim-mini/mini.ai',
    'https://github.com/nvim-mini/mini.statusline',
})

require('mini.pairs').setup()
require('mini.surround').setup()
require('mini.ai').setup()
require('mini.statusline').setup()
