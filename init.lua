require 'bootstrap'

-- truecolor
vim.opt.termguicolors = true
-- tabs
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- line number
vim.opt.number = true
vim.opt.relativenumber = true
-- keymaps
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', ',f', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], opts)
vim.api.nvim_set_keymap('n', ',g', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], opts)
vim.api.nvim_set_keymap('n', ',b', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], opts)
vim.api.nvim_set_keymap('n', ',t', [[<cmd>lua require('plugins.telescope').tabs()<cr>]], opts)
-- copy
vim.api.nvim_set_keymap('v', '<D-c>', [["+y]], opts)

require 'plugins'
