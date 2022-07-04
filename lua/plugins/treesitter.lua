require 'nvim-treesitter.configs'.setup {
    ensure_installed = { 'lua', 'vim' },
    highlight = {
        enable = true,
        use_languagetree = true
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    }
}
