local tools = require 'tools'
local colors = tools.colors

local mode_alias = {
    ['n'] = 'NORMAL',
    ['no'] = 'OP',
    ['nov'] = 'OP',
    ['noV'] = 'OP',
    ['no'] = 'OP',
    ['niI'] = 'NORMAL',
    ['niR'] = 'NORMAL',
    ['niV'] = 'NORMAL',
    ['v'] = 'VISUAL',
    ['V'] = 'LINES',
    [''] = 'BLOCK',
    ['s'] = 'SELECT',
    ['S'] = 'SELECT',
    [''] = 'BLOCK',
    ['i'] = 'INSERT',
    ['ic'] = 'INSERT',
    ['ix'] = 'INSERT',
    ['R'] = 'REPLACE',
    ['Rc'] = 'REPLACE',
    ['Rv'] = 'V-REPLACE',
    ['Rx'] = 'REPLACE',
    ['c'] = 'COMMAND',
    ['cv'] = 'COMMAND',
    ['ce'] = 'COMMAND',
    ['r'] = 'ENTER',
    ['rm'] = 'MORE',
    ['r?'] = 'CONFIRM',
    ['!'] = 'SHELL',
    ['t'] = 'TERM',
    ['nt'] = 'TERM',
    ['null'] = 'NONE',
}

local mode_colors = {
    NORMAL = colors.blue,
    INSERT = colors.green,
    VISUAL = colors.yellow,
    OP = colors.green,
    BLOCK = colors.yellow,
    REPLACE = colors.violet,
    ['V-REPLACE'] = colors.violet,
    ENTER = colors.cyan,
    MORE = colors.cyan,
    SELECT = colors.orange,
    COMMAND = colors.magenta,
    SHELL = colors.green,
    TERM = colors.green,
    NONE = colors.red
}

local function get_mode_color()
    return mode_colors[mode_alias[vim.api.nvim_get_mode().mode]]
end

local function hl_follow_mode()
    return {
        name = require('feline.providers.vi_mode').get_mode_highlight_name(),
        fg = get_mode_color(),
        style = 'bold'
    }
end


local left_sep = {
    str = ' ',
}


local right_sep = {
    str = ' ',
}


-- INFO: custom provider
-- a custom provider for the statusline is a function takes 2 arguments:
--     - component: current component itself
--     - opts: options for current component
-- and returns a string to be displayed
local providers = {
    git_branch = function(_, _) return tools.get_git_branch() end,
    git_add = function(_, _) return tools.get_git_add_status() end,
    git_mod = function(_, _) return tools.get_git_mod_status() end,
    git_del = function(_, _) return tools.get_git_del_status() end,
}

local comps = {
    mode = {
        provider = 'vi_mode',
        icon = '',
        hl = {
            style = 'bold'
        }
    },
    file_info = {
        provider = {
            name = 'file_info',
            opts = {
                type = 'relative',
            },
        },
        hl = hl_follow_mode,
        -- hl = function()
        --     return {
        --         name = require('feline.providers.vi_mode').get_mode_highlight_name(),
        --         fg = get_mode_color(),
        --         bg = colors.bg_dark,
        --         style = 'bold'
        --     }
        -- end,
        left_sep = left_sep,
    },
    git_branch = {
        provider = providers.git_branch,
        hl = hl_follow_mode,
        icon = ' ',
        left_sep = left_sep,
        right_sep = right_sep
    },
    git_add = {
        provider = providers.git_add,
        hl = { fg = colors.green },
        icon = '+',
    },
    git_change = {
        provider = providers.git_mod,
        hl = { fg = colors.blue },
        icon = '*',
        left_sep = left_sep,
    },
    git_delete = {
        provider = providers.git_del,
        hl = { fg = colors.red },
        icon = '-',
        left_sep = left_sep,
    },
    encoding = {
        provider = 'file_encoding',
        left_sep = left_sep,
    },
    format = { provider = 'file_format' },
    progress = {
        provider = 'scroll_bar',
        left_sep = left_sep,
        right_sep = right_sep,
        hl = hl_follow_mode,
    },
    file_type = {
        provider = {
            name = 'file_type',
            opts = {
                type = 'titlecase'
            },
        },
        hl = { fg = colors.blue },
    },
    file_size = {
        provider = 'file_size',
        hl = { fg = colors.blue },
        left_sep = left_sep,
    }
}

require('feline').setup {
    components = {
        active = {
            {
                comps.file_info,
            }, {
                -- lsp info
            }, {
                comps.git_branch, comps.git_add, comps.git_change, comps.git_delete,
                comps.encoding, comps.progress
            },
        },
        inactive = {
            { comps.file_type, comps.file_size },
            {}, {}
        },
    }
}
