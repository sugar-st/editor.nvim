local colors = {
    bg       = '#2c323c',
    -- fg       = none,
    yellow   = '#e5c07b',
    cyan     = '#8abeb7',
    darkblue = '#528bff',
    green    = '#98c379',
    orange   = '#d19a66',
    violet   = '#b294bb',
    magenta  = '#ff80ff',
    blue     = '#61afef';
    red      = '#e88388';
}

local vi_mode_colors = {
    ['NORMAL']    = colors.green,
    ['OP']        = colors.green,
    ['INSERT']    = colors.yellow,
    ['VISUAL']    = colors.blue,
    ['LINES']     = colors.blue,
    ['BLOCK']     = colors.blue,
    ['REPLACE']   = colors.violet,
    ['V-REPLACE'] = colors.violet,
    ['ENTER']     = colors.cyan,
    ['MORE']      = colors.cyan,
    ['SELECT']    = colors.orange,
    ['COMMAND']   = colors.green,
    ['SHELL']     = colors.green,
    ['TERM']      = colors.green,
    ['NONE']      = colors.red,
}

local vi_mode_text = {
    ['n']    = 'NORMAL',
    ['no']   = '  OP  ',
    ['nov']  = '  OP  ',
    ['noV']  = '  OP  ',
    ['no']  = '  OP  ',
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
    ['rm']   = ' MORE ',
    ['r?']   = 'CONFIRM',
    ['!']    = 'SHELL',
    ['t']    = ' TERM ',
    ['nt']   = ' TERM ',
    ['null'] = ' NONE ',
}

local lsp = require 'feline.providers.lsp'
local vi_mode = require 'feline.providers.vi_mode'

local comps = {
    vi_mode = {
        left = {
            provider = function()
                local current_text = ' ' .. vi_mode_text[vim.fn.mode()] .. ' '
                return current_text
            end,
            hl = function()
                return {
                    name = vi_mode.get_mode_highlight_name(),
                    fg = colors.bg,
                    bg = vi_mode_colors[vi_mode_text[vim.fn.mode()]],
                }
            end,
        },
        right = {
            provider = '▊',
            hl = function()
                local val = {
                    name = vi_mode.get_mode_highlight_name(),
                    fg = vi_mode_colors[vi_mode_text[vim.fn.mode()]],
                }
                return val
            end,
            left_sep = ' '
        }
    },
    file = {
        info = {
            provider = {
                name = 'file_info',
                opts = {
                    type = 'relative',
                }
            },
            enabled = function() return true end,
            hl = {
                -- fg = colors.blue,
                style = 'NONE'
            },
            left_sep = ' '
        },
        encoding = {
            provider = 'file_encoding',
            left_sep = ' ',
            hl = {
                fg = colors.violet,
                style = 'bold'
            }
        },
        type = {
            provider = {
                name = 'file_type',
                opts = {
                    case = 'lowercase'
                }
            },
            left_sep = ' ',
        },
        os = {
            provider = function()
                local os = vim.bo.fileformat:upper()
                local icon
                if os == 'UNIX' then
                    icon = ' '
                elseif os == 'MAC' then
                    icon = ' '
                else
                    icon = ' '
                end
                return icon .. os
            end,
            left_sep = ' ',
            hl = {
                fg = colors.violet,
                style = 'bold'
            }
        }
    },
    line_percentage = {
        provider = 'line_percentage',
        left_sep = ' ',
    },
    position = {
        provider = 'position',
        left_sep = ' ',
        hl = function()
            local val = {
                name = vi_mode.get_mode_highlight_name(),
                fg = colors.bg,
                bg = vi_mode.get_mode_color(),
                style = 'bold'
            }
            return val
        end
    },
    scroll_bar = {
        provider = 'scroll_bar',
        left_sep = ' ',
        hl = {
            fg = colors.blue,
            style = 'bold'
        }
    },
    diagnostic = {
        err = {
            provider = 'diagnostic_errors',
            enabled = function()
                return lsp.diagnostics_exist('Error')
            end,
            hl = {
                fg = colors.red
            },
            icon = '● ',
            left_sep = ' ',
        },
        warn = {
            provider = 'diagnostic_warnings',
            enabled = function()
                return lsp.diagnostics_exist('Warn')
            end,
            hl = {
                fg = colors.yellow
            },
            icon = '● ',
            left_sep = ' ',
        },
        hint = {
            provider = 'diagnostic_hints',
            enabled = function()
                return lsp.diagnostics_exist('Hint')
            end,
            hl = {
                fg = colors.cyan
            },
            icon = '● ',
            left_sep = ' ',
        },
        info = {
            provider = 'diagnostic_info',
            enabled = function()
                return lsp.diagnostics_exist('Info')
            end,
            hl = {
                fg = colors.blue
            },
            icon = '● ',
            left_sep = ' ',
        },
    },
    lsp = {
        name = {
            provider = 'lsp_client_names',
            left_sep = ' ',
            icon = '  ',
            hl = {
                fg = colors.yellow
            }
        }
    },
    git = {
        branch = {
            provider = 'git_branch',
            icon = {
                str = ' ',
                hl = {
                    fg = colors.cyan
                }
            },
            -- icon = 'git:',
            left_sep = ' ',
            -- hl = {
            --     fg = colors.red,
            -- },
        },
        add = {
            provider = 'git_diff_added',
            hl = {
                fg = colors.green
            }
        },
        change = {
            provider = 'git_diff_changed',
            hl = {
                fg = colors.orange
            }
        },
        remove = {
            provider = 'git_diff_removed',
            hl = {
                fg = colors.red
            }
        }
    }
}

require 'feline'.setup {
    components = {
        active = {
            {
                comps.vi_mode.left,
                comps.file.info,
                -- comps.git.branch,
                comps.diagnostic.err,
                comps.diagnostic.warn,
                comps.diagnostic.hint,
                comps.diagnostic.info
            }, {
            }, {
                comps.git.branch,
                comps.line_percentage,
                comps.vi_mode.right
            },
        },
        inactive = {
            {
                comps.file.type
            }, {}, {}
        }
    },
    force_inactive = {
        filetypes = {
            '^neo%-tree$',
            '^NvimTree$',
            '^packer$',
            '^alpha$',
            '^startify$',
            '^fugitive$',
            '^fugitiveblame$',
            '^qf$',
            '^help$',
            '^man$'
        },
        buftypes = { '^terminal$' },
        bufnames = {}
    },
    vi_mode_colors = vi_mode_colors,
}
