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
-- keymaps
local opts = {
    noremap = true,
    silent = true
}
-- telescope
vim.api.nvim_set_keymap('n', ',f', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], opts)
vim.api.nvim_set_keymap('n', ',g', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], opts)
vim.api.nvim_set_keymap('n', ',b', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], opts)
vim.api.nvim_set_keymap('n', ',t', [[<cmd>lua require('plugins.telescope').tabs()<cr>]], opts)

-- repo
vim.api.nvim_set_keymap('n', 'gj', [[<cmd>:VGit hunk_down<cr>]], opts)
vim.api.nvim_set_keymap('n', 'gk', [[<cmd>:VGit hunk_up<cr>]], opts)
vim.api.nvim_set_keymap('n', 'gp', [[<cmd>:VGit buffer_diff_preview<cr>]], opts)

-- window & buffer management
-- windows & linux
vim.api.nvim_set_keymap('n', '<A-h>', [[<cmd>lua require('smart-splits').resize_left(1)<cr>]], opts)
vim.api.nvim_set_keymap('n', '<A-j>', [[<cmd>lua require('smart-splits').resize_down(1)<cr>]], opts)
vim.api.nvim_set_keymap('n', '<A-k>', [[<cmd>lua require('smart-splits').resize_up(1)<cr>]], opts)
vim.api.nvim_set_keymap('n', '<A-l>', [[<cmd>lua require('smart-splits').resize_right(1)<cr>]], opts)
vim.api.nvim_set_keymap('n', '<A-s>', [[<cmd>:sp<cr>]], opts)
vim.api.nvim_set_keymap('n', '<A-v>', [[<cmd>:vsp<cr>]], opts)
-- macOS
vim.api.nvim_set_keymap('n', '˙', [[<cmd>lua require('smart-splits').resize_left(1)<cr>]], opts)
vim.api.nvim_set_keymap('n', '∆', [[<cmd>lua require('smart-splits').resize_down(1)<cr>]], opts)
vim.api.nvim_set_keymap('n', '˚', [[<cmd>lua require('smart-splits').resize_up(1)<cr>]], opts)
vim.api.nvim_set_keymap('n', '¬', [[<cmd>lua require('smart-splits').resize_right(1)<cr>]], opts)
vim.api.nvim_set_keymap('n', 'ß', [[<cmd>:sp<cr>]], opts)
vim.api.nvim_set_keymap('n', '√', [[<cmd>:vsp<cr>]], opts)

vim.api.nvim_set_keymap('n', '<C-h>', [[<cmd>lua require('smart-splits').move_cursor_left()<cr>]], opts)
vim.api.nvim_set_keymap('n', '<C-j>', [[<cmd>lua require('smart-splits').move_cursor_down()<cr>]], opts)
vim.api.nvim_set_keymap('n', '<C-k>', [[<cmd>lua require('smart-splits').move_cursor_up(true)<cr>]], opts)
vim.api.nvim_set_keymap('n', '<C-l>', [[<cmd>lua require('smart-splits').move_cursor_right(true)<cr>]], opts)

vim.api.nvim_set_keymap('n', '<C-w>', [[<cmd>:wq<cr>]], opts) -- buffer wipeout
vim.api.nvim_set_keymap('n', '<C-s>', [[<cmd>:w<cr>]], opts) -- buffer save
vim.api.nvim_set_keymap('n', '<C-q>', [[<cmd>:q<cr>]], opts) -- buffer quit
vim.api.nvim_set_keymap('n', '<C-r>', [[<cmd>:q!<cr>]], opts) -- buffer remove
vim.api.nvim_set_keymap('n', '<C-a>', [[<cmd>:qa<cr>]], opts) -- quit vim

-- copy
vim.api.nvim_set_keymap('v', '<C-c>', [["+y]], opts)

-- others
vim.api.nvim_set_keymap('n', '<C-p>', [[<cmd>:PackerSync<cr>]], opts)

require 'plugins'
