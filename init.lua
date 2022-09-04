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
map('n', ',,', [[<Cmd>:Telescope<CR>]])
map('n', ',p', [[<Cmd>:SessionManager load_session<CR>]])
map('n', ',f', telescope_builtin.find_files)
map('n', ',F', telescope_builtin.live_grep)
map('n', ',b', telescope_builtin.buffers)
map('n', ',d', telescope_builtin.diagnostics)
map('n', ',s', telescope_builtin.lsp_workspace_symbols)

-- lsp
map('n', '<Space>d', telescope_builtin.lsp_definitions)
map('n', '<Space>t', telescope_builtin.lsp_type_definitions)
map('n', '<Space>r', telescope_builtin.lsp_references)
map('n', '<Space>i', telescope_builtin.lsp_implementations)
map('n', '<Space>s', telescope_builtin.lsp_document_symbols)
map('n', '<Space>rn', vim.lsp.buf.rename)
map('n', '<Space>c', vim.lsp.buf.code_action)
map('n', '<Space>h', vim.lsp.buf.hover)

-- repo
map('n', ',g', [[<Cmd>:Gitsigns<CR>]])
map('n', 'gj', [[<Cmd>:Gitsigns next_hunk<CR>]])
map('n', 'gk', [[<Cmd>:Gitsigns prev_hunk<CR>]])
map('n', 'gp', [[<Cmd>:Gitsigns diffthis<CR>]])
map('n', 'gb', telescope_builtin.git_branches)

-- window, tab and buffer management
local splits = require 'smart-splits'
if vim.fn.has('mac') then
    map({ 'n', 'i' }, '˙', splits.resize_left)
    map({ 'n', 'i' }, '∆', splits.resize_down)
    map({ 'n', 'i' }, '˚', splits.resize_up)
    map({ 'n', 'i' }, '¬', splits.resize_right)
    map({ 'n', 'i' }, 'ß', [[<Cmd>:sp<CR>]])
    map({ 'n', 'i' }, '√', [[<Cmd>:vsp<CR>]])
end
if vim.fn.has('linux') then
    map({ 'n', 'i' }, '<A-h>', splits.resize_left)
    map({ 'n', 'i' }, '<A-j>', splits.resize_down)
    map({ 'n', 'i' }, '<A-k>', splits.resize_up)
    map({ 'n', 'i' }, '<A-l>', splits.resize_right)
    map({ 'n', 'i' }, '<A-s>', [[<Cmd>:sp<CR>]])
    map({ 'n', 'i' }, '<A-v>', [[<Cmd>:vsp<CR>]])
end
map({ 'n', 'i' }, '<C-h>', splits.move_cursor_left)
map({ 'n', 'i' }, '<C-j>', splits.move_cursor_down)
map({ 'n', 'i' }, '<C-k>', splits.move_cursor_up)
map({ 'n', 'i' }, '<C-l>', splits.move_cursor_right)

map('n', '<C-t>', [[<Cmd>:tabnew<CR>]]) -- new tab
map('n', 'tn', [[<Cmd>:tabnext<CR>]]) -- prev tab
map('n', 'tp', [[<Cmd>:tabprevious<CR>]]) -- nex tab
-- copy
vim.opt.clipboard = 'unnamedplus'

-- others
map('n', '<C-p>', [[<Cmd>:PackerSync<CR>]])

require 'plugins'
