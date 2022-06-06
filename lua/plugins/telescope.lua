M = {}

require('telescope').load_extension('tele_tabby')
require('telescope').setup {
    defaults = {
        prompt_prefix = ' 🔍 '
    },
    pickers = {
        fd = {
            theme = 'dropdown',
            previewer = false
        },
        find_files = {
            theme = 'dropdown',
            previewer = false
        },
        buffers = {
            theme = 'dropdown',
            previewer = false
        }
    },
    extensions = {
        tele_tabby = {
            use_highlighter = true
        }
    }
}

function M.tabs()
    local themes = require('telescope.themes')
    local opts = themes.get_dropdown {
        winblend = 10,
        border = true,
        previewer = false,
        shorten_path = false
        -- heigth=20,
        -- width= 120
    }
    require'telescope'.extensions.tele_tabby.list(opts)
end

return M
