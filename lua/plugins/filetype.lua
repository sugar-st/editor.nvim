require("filetype").setup({
    overrides = {
        function_extensions = {
            ["go"] = function()
                --vim.bo.filetype = "go"
                -- Remove annoying indent jumping
                vim.bo.expandtab = false
                vim.bo.cinoptions = vim.bo.cinoptions .. "L0"
            end,
        }
    }
})