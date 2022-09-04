M = {}

local telescope = require 'telescope'

local TelescopePrompt = {
    -- TelescopePromptNormal = {
    --     bg = '#2d3149',
    -- },
    -- TelescopePromptBorder = {
    --     bg = '#2d3149',
    -- },
    -- TelescopePromptTitle = {
    --     fg = '#2d3149',
    --     bg = '#2d3149',
    -- },
    -- TelescopePreviewTitle = {
    --     fg = '#1F2335',
    --     bg = '#1F2335',
    -- },
    -- TelescopeResultsTitle = {
    --     fg = '#1F2335',
    --     bg = '#1F2335',
    -- },
}
for hl, col in pairs(TelescopePrompt) do
    vim.api.nvim_set_hl(0, hl, col)
end

telescope.setup {
    defaults = {
        prompt_prefix   = ' ﲵ  ',
        selection_caret = '  ',
        prompt_title    = '',
        -- border          = false,
        results_title   = '',
        preview_title   = '',
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
        ['ui-select'] = {
            require("telescope.themes").get_dropdown {
                -- even more opts
            }

            -- pseudo code / specification for writing custom displays, like the one
            -- for "codeactions"
            -- specific_opts = {
            --   [kind] = {
            --     make_indexed = function(items) -> indexed_items, width,
            --     make_displayer = function(widths) -> displayer
            --     make_display = function(displayer) -> function(e)
            --     make_ordinal = function(e) -> string
            --   },
            --   -- for example to disable the custom builtin "codeactions" display
            --      do the following
            --   codeactions = false,
            -- }
        }
    }
}

telescope.load_extension("ui-select")


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

require 'icon-picker'.setup {
    disable_legacy_commands = true
}

return M
