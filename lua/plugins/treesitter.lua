local colors = require 'tools'.colors
require 'nvim-treesitter.configs'.setup {
    ensure_installed = { 'lua', 'vim' },
    highlight = {
        enable = true,
        use_languagetree = true
    },
    rainbow = {
        enable = true,
        colors = {
            colors.yellow,
            colors.cyan,
            colors.blue,
            colors.green,
            colors.orange,
            colors.violet,
            colors.magenta,
        },
        extended_mode = true,
        max_file_lines = nil,
    }
}
