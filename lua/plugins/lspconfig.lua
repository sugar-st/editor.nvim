local lspconfig = require 'lspconfig'

local common_attach_func = function(client)
    require 'illuminate'.on_attach(client)
    require 'lsp-format'.on_attach(client)
end

-- cancel signcolumns on purpose
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    -- vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    vim.fn.sign_define(hl, { text = '', texthl = '', numhl = '' })
end

vim.diagnostic.config({
    virtual_text = {
        -- source = "always",  -- Or "if_many"
        prefix = '●', -- Could be '■', '▎', 'x'
    },
    severity_sort = true,
    float = {
        source = "always", -- Or "if_many"
    },
})

-- lua
local luadev = require 'lua-dev'.setup {
    lspconfig = {
        on_attach = function(client)
            common_attach_func(client)
        end,
    },
}
lspconfig.sumneko_lua.setup(luadev)

-- golang
lspconfig.gopls.setup {
    on_attach = function(client)
        common_attach_func(client)
    end
}
lspconfig.golangci_lint_ls.setup {}

-- rust
require 'rust-tools'.setup {}
lspconfig.rust_analyzer.setup {
    on_attach = function(client)
        common_attach_func(client)
    end
}

-- c
lspconfig.clangd.setup {}

-- json
lspconfig.jsonls.setup {}
