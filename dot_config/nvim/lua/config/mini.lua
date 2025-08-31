require("mini.ai").setup({ n_lines = 500 })
require("mini.comment").setup()
require("mini.move").setup()
require("mini.splitjoin").setup()
require("mini.surround").setup()
require("mini.diff").setup()
require("mini.indentscope").setup({
    draw = {
        delay = 0,
    }
})
