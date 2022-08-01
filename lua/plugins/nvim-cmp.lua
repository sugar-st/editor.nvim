local cmp = require 'cmp'

local kind_icons = {
    Text          = '',
    Constructor   = '',
    Method        = '',
    Function      = '',
    Operator      = '烈',
    Module        = 'ﬥ',
    Unit          = 'ﬧ',
    Field         = '',
    Property      = '',
    Variable      = 'ﬦ',
    Constant      = '',
    EnumMember    = '炙',
    Enum          = '炙',
    Class         = 'ﴰ',
    Struct        = '',
    Interface     = '',
    Event         = 'ﯠ',
    Color         = '',
    Value         = '',
    Keyword       = '',
    Snippet       = '謹',
    File          = '',
    Reference     = '',
    Folder        = '',
    TypeParameter = ''
}

cmp.setup({
    preselect = cmp.PreselectMode.None,
    snippet = {
        expand = function(args)
            vim.fn['UltiSnips#Anon'](args.body)
        end
    },
    window = {
        completion = {
            col_offset   = -3,
            side_padding = 0,
        },
        documentation = {}
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>']     = cmp.mapping.scroll_docs(-4),
        ['<C-f>']     = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-c>']     = cmp.mapping.abort(),
        ['<CR>']      = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources(
        { { name = 'nvim_lsp' } },
        { { name = 'nvim_lsp_signature_help' } },
        { { name = 'ultisnips' } },
        { { name = 'buffer' } }
    ),
    formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = function(entry, vim_item)
            vim_item.kind = string.format(' %s ', kind_icons[vim_item.kind]) -- This concatonates the icons with the name of the item kind
            vim_item.menu = ({
                buffer    = '[Buff]',
                nvim_lsp  = '[LSP]',
                ultisnips = '[Snip]',
            })[entry.source.name]
            return vim_item
        end
    }
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources(
        { { name = 'cmp_git' } }, -- You can specify the `cmp_git` source if you were installed it.
        { { name = 'buffer' } }
    )
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
        { { name = 'buffer' } }
    )
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
        { { name = 'path' } },
        { { name = 'cmdline' } }
    )
})
