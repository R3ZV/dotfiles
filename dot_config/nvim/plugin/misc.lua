vim.pack.add({
    'https://github.com/nvim-mini/mini.pairs',
    'https://github.com/nvim-mini/mini.surround',
    'https://github.com/nvim-mini/mini.ai',
    'https://github.com/nvim-mini/mini.statusline',
    'https://github.com/NMAC427/guess-indent.nvim',
    'https://github.com/chomosuke/typst-preview.nvim',
})

require('typst-preview').setup()
require('guess-indent').setup()
require('mini.pairs').setup()
require('mini.surround').setup()
require('mini.ai').setup()
require('mini.statusline').setup()
