local colors = {
    bg = '#282c34',
    fg = '#abb2bf',
    yellow = '#e0af68',
    cyan = '#56b6c2',
    darkblue = '#081633',
    green = '#98c379',
    orange = '#d19a66',
    violet = '#a9a1e1',
    magenta = '#c678dd',
    blue = '#61afef',
    red = '#e86671'
}

colors.git_status = {
    added = colors.green,
    changed = colors.blue,
    removed = colors.red,
}

-- vertical_bar	'┃'
-- vertical_bar_thin	'│'
-- left	''
-- right	''
-- block	'█'
-- left_filled	''
-- right_filled	''
-- slant_left	''
-- slant_left_thin	''
-- slant_right	''
-- slant_right_thin	''
-- slant_left_2	''
-- slant_left_2_thin	''
-- slant_right_2	''
-- slant_right_2_thin	''
-- left_rounded	''
-- left_rounded_thin	''
-- right_rounded	''
-- right_rounded_thin	''
-- circle	'●'

local mode_alias = {
    ['n']    = 'NORMAL',
    ['no']   = 'OP',
    ['nov']  = 'OP',
    ['noV']  = 'OP',
    ['no']  = 'OP',
    ['niI']  = 'NORMAL',
    ['niR']  = 'NORMAL',
    ['niV']  = 'NORMAL',
    ['v']    = 'VISUAL',
    ['V']    = 'LINES',
    ['']    = 'BLOCK',
    ['s']    = 'SELECT',
    ['S']    = 'SELECT',
    ['']    = 'BLOCK',
    ['i']    = 'INSERT',
    ['ic']   = 'INSERT',
    ['ix']   = 'INSERT',
    ['R']    = 'REPLACE',
    ['Rc']   = 'REPLACE',
    ['Rv']   = 'V-REPLACE',
    ['Rx']   = 'REPLACE',
    ['c']    = 'COMMAND',
    ['cv']   = 'COMMAND',
    ['ce']   = 'COMMAND',
    ['r']    = 'ENTER',
    ['rm']   = 'MORE',
    ['r?']   = 'CONFIRM',
    ['!']    = 'SHELL',
    ['t']    = 'TERM',
    ['nt']   = 'TERM',
    ['null'] = 'NONE',
}

local mode_colors = {
    NORMAL = colors.green,
    INSERT = colors.red,
    VISUAL = colors.magenta,
    OP = colors.green,
    BLOCK = colors.blue,
    REPLACE = colors.violet,
    ['V-REPLACE'] = colors.violet,
    ENTER = colors.cyan,
    MORE = colors.cyan,
    SELECT = colors.orange,
    COMMAND = colors.green,
    SHELL = colors.green,
    TERM = colors.green,
    NONE = colors.yellow
}

-- local mode_colors = {
--     NORMAL        = colors.blue,
--     INSERT        = colors.green,
--     VISUAL        = colors.yellow,
--     OP            = colors.green,
--     BLOCK         = colors.yellow,
--     REPLACE       = colors.violet,
--     ['V-REPLACE'] = colors.violet,
--     ENTER         = colors.cyan,
--     MORE          = colors.cyan,
--     SELECT        = colors.orange,
--     COMMAND       = colors.magenta,
--     SHELL         = colors.green,
--     TERM          = colors.green,
--     NONE          = colors.red
-- }

local function get_mode_color()
    return mode_colors[ mode_alias[vim.api.nvim_get_mode().mode] ]
end

local function hl_follow_mode()
    return {
        name = require 'feline.providers.vi_mode'.get_mode_highlight_name(),
        -- fg    = get_mode_color(),
        -- style = 'bold'
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
    git_branch   = 'git_branch',
    git_add      = 'git_diff_added',
    git_mod      = 'git_diff_changed',
    git_del      = 'git_diff_removed',
    -- git_branch   = function(_, _) return tools.get_git_branch() end,
    -- git_add      = function(_, _) return tools.get_git_add_status() end,
    -- git_mod      = function(_, _) return tools.get_git_mod_status() end,
    -- git_del      = function(_, _) return tools.get_git_del_status() end,
    current_func = function(_, _)
        local res = require 'nvim-treesitter'.statusline()
        return res
    end,
}

local comps = {
    left = {
        provider = '█'
    },
    right = {
        provider = ''
    },
    sep = {
        provider = '┃'
    },
    mode = {
        provider = 'vi_mode',
        icon = '',
        -- hl = {
        --     style = 'bold'
        -- },
        left_sep = ' ',
        right_sep = ' ',
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
        --         name = require 'feline.providers.vi_mode'.get_mode_highlight_name(),
        --         fg = get_mode_color(),
        --         bg = colors.bg_dark,
        --         style = 'bold'
        --     }
        -- end,
        left_sep = left_sep,
        right_sep = right_sep,
    },
    current_func = {
        provider = providers.current_func,
        hl = hl_follow_mode,
        right_sep = right_sep
    },
    git = {
        branch = {
            provider = providers.git_branch,
            icon = ' ',
            left_sep = left_sep,
            right_sep = right_sep,
        },
        add = {
            provider = providers.git_add,
            hl = 'GitSignsAdd',
        },
        change = {
            provider = providers.git_mod,
            hl = 'GitSignsChange',
        },
        delete = {
            provider = providers.git_del,
            right_sep = right_sep,
            hl = 'GitSignsDelete',
        },
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
    },
    diagnostic = {
        info = {
            provider = 'diagnostic_info',
            hl = 'DiagnosticInfo',
        },
        hints = {
            provider = 'diagnostic_hints',
            hl = 'DiagnosticHint',
        },
        warnings = {
            provider = 'diagnostic_warnings',
            hl = 'DiagnosticWarn',
        },
        errors = {
            provider = 'diagnostic_errors',
            hl = 'DiagnosticError',
        },
    }
}

require 'feline'.setup {
    colors = { bg = colors.bg, fg = colors.fg },
    components = {
        active = {
            {
                comps.left,
                comps.mode,
                comps.sep,
                comps.file_info,
                comps.sep,
                comps.diagnostic.hints, comps.diagnostic.info, comps.diagnostic.warnings, comps.diagnostic.errors,
                comps.right,
            }, {

            }, {
                comps.git.branch,
                comps.sep,
                comps.git.add, comps.git.change, comps.git.delete,
                comps.sep,
                comps.encoding, comps.progress,
            }
        },
        inactive = {
            { comps.file_type, comps.file_size },
        }

    },
}
