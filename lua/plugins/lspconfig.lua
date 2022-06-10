local lspconfig = require("lspconfig")

-- lua
local luadev = require("lua-dev").setup {
    -- add any options here, or leave empty to use the default settings
    -- lspconfig = {
    --   cmd = {"lua-language-server"}
    -- },
}
lspconfig.sumneko_lua.setup(luadev)
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
--                 library = vim.api.nvim_get_runtime_file("", true)
--             },
--             -- Do not send telemetry data containing a randomized but unique identifier
--             telemetry = {
--                 enable = false
--             }
--         }
--     }
-- }

-- golang
lspconfig.golangci_lint_ls.setup{}
lspconfig.gopls.setup{}
