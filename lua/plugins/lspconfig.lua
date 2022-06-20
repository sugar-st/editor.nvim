local lspconfig = require 'lspconfig'

local common_attach_func = function(client)
    require 'illuminate'.on_attach(client)
    require 'lsp_signature'.on_attach {
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        handler_opts = {
            border = 'rounded'
        }
    }
    require 'lsp-format'.on_attach(client)
end

-- lua
local luadev = require 'lua-dev'.setup {
    -- add any options here, or leave empty to use the default settings
    lspconfig = {
        -- cmd = { 'lua-language-server' },
        on_attach = function(client)
            common_attach_func(client)
        end,
    },
}

lspconfig.sumneko_lua.setup(luadev)
-- lspconfig.sumneko_lua.setup {
--     diagnostics = {
--         enable = false
--     },
--     format = {
--         enable = false,
--         -- Put format options here
--         -- NOTE: the value should be STRING!!
--         defaultConfig = {
--             indent_style = "space",
--             indent_size = "2",
--         }
--     },
--     on_attach = function(client)
--         common_attach_func(client)
--     end,
-- }
-- lspconfig.sumneko_lua.setup {
--     settings = {
--         Lua = {
--             runtime = {
--                 -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--                 version = 'LuaJIT'
--             },
--             diagnostics = {
--                 -- Get the language server to recognize the `vim` global
--                 globals = {'vim'}
--             },
--             workspace = {
--                 -- Make the server aware of Neovim runtime files
--                 library = vim.api.nvim_get_runtime_file('', true)
--             },
--             -- Do not send telemetry data containing a randomized but unique identifier
--             telemetry = {
--                 enable = false
--             }
--         }
--     }
-- }

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
    end
}
