require'nvim-treesitter.configs'.setup {
    ensure_installed = {"lua", "vim"},
    highlight = {
        enable = true,
        use_languagetree = true
    }
}
