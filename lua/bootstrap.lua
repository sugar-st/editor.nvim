local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
                                  install_path})
end

require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'feline-nvim/feline.nvim'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}}
    }
    use 'TC72/telescope-tele-tabby.nvim'
    -- git
    use {
        'tanvirtin/vgit.nvim',
        requires = {{'nvim-lua/plenary.nvim'}}
    }
    use 'mrjones2014/smart-splits.nvim'
    use 'nacro90/numb.nvim'
    use 'haringsrob/nvim_context_vt'
    -- completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'SirVer/ultisnips'
    use 'quangnguyen30192/cmp-nvim-ultisnips'
    -- theme
    use 'folke/tokyonight.nvim'
    use 'kyazdani42/nvim-web-devicons'
end)

