M = {}

local function to_string(value)
    if type(value) == "number" and value > 0 then
        return '' .. value
    end
    return ''
end

function M.get_git_branch()
    local branch = vim.fn.system({ 'git', 'branch', '--show-current' }):gsub("%s+", "")
    if vim.v.shell_error == 0 and branch then
        return branch
    end
    return ''
end

function M.get_git_add_status()
    if vim.b.vgit_status then
        return to_string(vim.b.vgit_status.added)
    end
    return ''
end

function M.get_git_mod_status()
    if vim.b.vgit_status then
        return to_string(vim.b.vgit_status.changed)
    end
    return ''
end

function M.get_git_del_status()
    if vim.b.vgit_status then
        return to_string(vim.b.vgit_status.removed)
    end
    return ''
end

M.colors = require 'tokyonight.colors'.setup {}


return M
