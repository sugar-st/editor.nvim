require 'bootstrap'
-- hide mode
vim.opt.showmode = false
-- truecolor
vim.opt.termguicolors = true
-- tabs
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- line number
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
-- keymaps

local map = require 'tools'.map
local telescope_builtin = require 'telescope.builtin'
map('n', ',f', telescope_builtin.find_files)
map('n', ',g', telescope_builtin.live_grep)
map('n', ',b', telescope_builtin.buffers)
-- map('n', ',t', require 'plugins.telescope'.tabs)
map('n', ',d', telescope_builtin.diagnostics)
map('n', ',s', telescope_builtin.lsp_workspace_symbols)

-- lsp
map('n', '<space>d', telescope_builtin.lsp_definitions)
map('n', '<space>t', telescope_builtin.lsp_type_definitions)
map('n', '<space>r', telescope_builtin.lsp_references)
map('n', '<space>i', telescope_builtin.lsp_implementations)
map('n', '<space>s', telescope_builtin.lsp_document_symbols)
map('n', '<space>rn', vim.lsp.buf.rename)
map('n', '<space>c', vim.lsp.buf.code_action)
map('n', '<space>h', vim.lsp.buf.hover)

-- repo
map('n', 'gj', [[<cmd>:Gitsigns next_hunk<cr>]])
map('n', 'gk', [[<cmd>:Gitsigns prev_hunk<cr>]])
map('n', 'gp', [[<cmd>:Gitsigns diffthis<cr>]])
map('n', 'gb', telescope_builtin.git_branches)

-- window, tab and buffer management
local splits = require 'smart-splits'
if vim.fn.has('mac') then
    map('n', '˙', splits.resize_left)
    map('n', '∆', splits.resize_down)
    map('n', '˚', splits.resize_up)
    map('n', '¬', splits.resize_right)
    map('n', 'ß', [[<cmd>:sp<cr>]])
    map('n', '√', [[<cmd>:vsp<cr>]])
end
if vim.fn.has('linux') then
    map('n', '<A-h>', splits.resize_left)
    map('n', '<A-j>', splits.resize_down)
    map('n', '<A-k>', splits.resize_up)
    map('n', '<A-l>', splits.resize_right)
    map('n', '<A-s>', [[<cmd>:sp<cr>]])
    map('n', '<A-v>', [[<cmd>:vsp<cr>]])
end
map('n', '<C-h>', splits.move_cursor_left)
map('n', '<C-j>', splits.move_cursor_down)
map('n', '<C-k>', splits.move_cursor_up)
map('n', '<C-l>', splits.move_cursor_right)

map('n', '<C-t>', [[<cmd>:tabnew<cr>]]) -- new tab
map('n', 'tn', [[<cmd>:tabnext<cr>]]) -- prev tab
map('n', 'tp', [[<cmd>:tabprevious<cr>]]) -- nex tab

-- copy
vim.opt.clipboard = 'unnamedplus'

-- others
map('n', '<C-p>', [[<cmd>:PackerSync<cr>]])

require 'plugins'
