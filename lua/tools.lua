M = {}

function M.get_git_branch()
    local branch = vim.fn.system({ 'git', 'branch', '--show-current' }):gsub("%s+", "")
    if vim.v.shell_error == 0 and branch then
        return branch
    end
    return ''
end

local function set_highlights(groups)
    local lines = {}
    for group, opts in pairs(groups) do
        if opts.link then
            table.insert(lines, fmt("highlight! link %s %s", group, opts.link))
        else
            table.insert(
                lines,
                fmt(
                    "highlight %s guifg=%s guibg=%s gui=%s guisp=%s",
                    group,
                    opts.fg or "NONE",
                    opts.bg or "NONE",
                    opts.style or "NONE",
                    opts.sp or "NONE"
                )
            )
        end
    end
    vim.cmd(table.concat(lines, " | "))
end

M.colors = {
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


function M.map(mode, l, r, opts)
    opts = opts or {}
    vim.keymap.set(mode, l, r, opts)
end

return M
