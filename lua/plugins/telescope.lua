M = {}

require 'telescope'.setup {
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
    -- extensions = {
    --     tele_tabby = {
    --         use_highlighter = true
    --     }
    -- }
}

-- function M.tabs()
--     local themes = require 'telescope.themes'
--     local opts = themes.get_dropdown {
--         winblend = 10,
--         border = true,
--         previewer = false,
--         shorten_path = false
--         -- heigth=20,
--         -- width= 120
--     }
--     require 'telescope'.extensions.tele_tabby.list(opts)
-- end

return M

-- local actions = require "telescope.actions"
-- local action_state = require "telescope.actions.state"
--
-- require "telescope".setup {
--     pickers = {
--         find_files = {
--             on_input_filter_cb = function(prompt)
--                 if prompt:sub(#prompt) == "@" then
--                     vim.schedule(function()
--                         -- schedule is required as actions otherwise don't work in async
--                         local prompt_bufnr = vim.api.nvim_get_current_buf()
--                         require("telescope.actions").select_default(prompt_bufnr)
--                         require("telescope.builtin").lsp_document_symbols()
--                         -- hack as otherwise picker doesn't go into insert mode
--                         vim.cmd [[normal! A]]
--                     end)
--                 end
--                 local find_colon = string.find(prompt, ":")
--                 if find_colon then
--                     local ret = string.sub(prompt, 1, find_colon - 1)
--                     vim.schedule(function()
--                         local prompt_bufnr = vim.api.nvim_get_current_buf()
--                         local picker = action_state.get_current_picker(prompt_bufnr)
--                         local lnum = tonumber(prompt:sub(find_colon + 1))
--                         if type(lnum) == "number" then
--                             local win = picker.previewer.state.winid
--                             local bufnr = picker.previewer.state.bufnr
--                             local line_count = vim.api.nvim_buf_line_count(bufnr)
--                             vim.api.nvim_win_set_cursor(win, { math.max(1, math.min(lnum, line_count)), 0 })
--                         end
--                     end)
--                     return { prompt = ret }
--                 end
--             end,
--             attach_mappings = function()
--                 actions.select_default:enhance {
--                     post = function()
--                         -- if we found something, go to line
--                         local prompt = action_state.get_current_line()
--                         local find_colon = string.find(prompt, ":")
--                         if find_colon then
--                             local lnum = tonumber(prompt:sub(find_colon + 1))
--                             vim.api.nvim_win_set_cursor(0, { lnum, 0 })
--                         end
--                     end,
--                 }
--                 return true
--             end,
--         },
--     }
-- }
-- return M
