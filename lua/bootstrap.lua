local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

require 'packer'.startup(function()
    use 'lewis6991/impatient.nvim'
    use 'wbthomason/packer.nvim'
    use 'feline-nvim/feline.nvim'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'
    use 'jose-elias-alvarez/null-ls.nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'p00f/nvim-ts-rainbow'
    use 'lukas-reineke/lsp-format.nvim'
    -- telescope
    use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' }
    use 'nvim-telescope/telescope-ui-select.nvim'
    use {
        'ziontee113/icon-picker.nvim',
        config = function()
            require('icon-picker').setup({
                disable_legacy_commands = true
            })
        end,
    }
    -- git
    -- use {
    --     'tanvirtin/vgit.nvim',
    --     requires = { { 'nvim-lua/plenary.nvim' } }
    -- }
    use 'lewis6991/gitsigns.nvim'
    use 'mrjones2014/smart-splits.nvim'
    use 'nacro90/numb.nvim'
    -- use 'haringsrob/nvim_context_vt'
    -- completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'SirVer/ultisnips'
    use 'quangnguyen30192/cmp-nvim-ultisnips'
    use 'windwp/nvim-autopairs'
    -- rust
    use 'simrat39/rust-tools.nvim'
    -- lua
    use 'folke/lua-dev.nvim'
    -- theme
    -- use 'folke/tokyonight.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'projekt0n/github-nvim-theme'
    use 'RRethy/vim-illuminate'
    use 'nvim-neo-tree/neo-tree.nvim'
    use 'MunifTanjim/nui.nvim'
    use 'j-hui/fidget.nvim'
    use { 'goolord/alpha-nvim', requires = 'kyazdani42/nvim-web-devicons' }
    use 'Shatur/neovim-session-manager'
end)
