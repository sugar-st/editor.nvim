local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
                                  install_path})
end

require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'feline-nvim/feline.nvim'
    use 'nathom/filetype.nvim'
    use 'neovim/nvim-lspconfig'
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
end)

