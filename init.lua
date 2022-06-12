require 'bootstrap'
-- theme
vim.cmd [[colorscheme tokyonight]]
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
local opts = {
    noremap = true,
    silent = true
}
-- telescope
local telescope_builtin = require 'telescope.builtin'
vim.keymap.set('n', ',f', telescope_builtin.find_files, opts)
vim.keymap.set('n', ',g', telescope_builtin.live_grep, opts)
vim.keymap.set('n', ',b', telescope_builtin.buffers, opts)
vim.keymap.set('n', ',t', require('plugins.telescope').tabs, opts)

-- lsp
vim.keymap.set('n', '<space>d', telescope_builtin.lsp_definitions, opts)
vim.keymap.set('n', '<space>t', telescope_builtin.lsp_type_definitions, opts)
vim.keymap.set('n', '<space>r', telescope_builtin.lsp_references, opts)
vim.keymap.set('n', '<space>i', telescope_builtin.lsp_implementations, opts)
vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
vim.keymap.set('n', '<space>c', vim.lsp.buf.code_action, opts)

-- repo
vim.api.nvim_set_keymap('n', 'gj', [[<cmd>:VGit hunk_down<cr>]], opts)
vim.api.nvim_set_keymap('n', 'gk', [[<cmd>:VGit hunk_up<cr>]], opts)
vim.api.nvim_set_keymap('n', 'gp', [[<cmd>:VGit buffer_diff_preview<cr>]], opts)
vim.keymap.set('n', 'gb', telescope_builtin.git_branches, opts)


-- window & buffer management
-- windows & linux
local splits = require 'smart-splits'
vim.keymap.set('n', '<A-h>', splits.resize_left, opts)
vim.keymap.set('n', '<A-j>', splits.resize_down, opts)
vim.keymap.set('n', '<A-k>', splits.resize_up, opts)
vim.keymap.set('n', '<A-l>', splits.resize_right, opts)
vim.api.nvim_set_keymap('n', '<A-s>', [[<cmd>:sp<cr>]], opts)
vim.api.nvim_set_keymap('n', '<A-v>', [[<cmd>:vsp<cr>]], opts)
-- macOS
vim.keymap.set('n', '˙', splits.resize_left, opts)
vim.keymap.set('n', '∆', splits.resize_down, opts)
vim.keymap.set('n', '˚', splits.resize_up, opts)
vim.keymap.set('n', '¬', splits.resize_right, opts)
vim.api.nvim_set_keymap('n', 'ß', [[<cmd>:sp<cr>]], opts)
vim.api.nvim_set_keymap('n', '√', [[<cmd>:vsp<cr>]], opts)

vim.keymap.set('n', '<C-h>', splits.move_cursor_left, opts)
vim.keymap.set('n', '<C-j>', splits.move_cursor_down, opts)
vim.keymap.set('n', '<C-k>', splits.move_cursor_up, opts)
vim.keymap.set('n', '<C-l>', splits.move_cursor_right, opts)

vim.api.nvim_set_keymap('n', '<C-t>', [[<cmd>:tabnew<cr>]], opts) -- new tab

-- copy
vim.api.nvim_set_keymap('v', '<C-c>', [["+y]], opts)

-- others
vim.api.nvim_set_keymap('n', '<C-p>', [[<cmd>:PackerSync<cr>]], opts)

require 'plugins'
