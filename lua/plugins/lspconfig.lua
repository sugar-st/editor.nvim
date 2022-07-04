local lspconfig = require 'lspconfig'

local common_attach_func = function(client)
    require 'illuminate'.on_attach(client)
    require 'lsp-format'.on_attach(client)
end

-- lua
local luadev = require 'lua-dev'.setup {
    -- add any options here, or leave empty to use the default settings
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
lspconfig.rust_analyzer.setup {
    on_attach = function(client)
        common_attach_func(client)
        require 'rust-tools.inlay_hints'.set_inlay_hints()
    end
}
