vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer.nvim
    use 'wbthomason/packer.nvim'

    -- Telescope.nvim
    use {
        'nvim-telescope/telescope.nvim',
    }
    use "nvim-lua/plenary.nvim"

    -- Color Scheme
    use({ 'rose-pine/neovim', as = 'rose-pine' })

    -- Treesitter.lua
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Mini.nvim statusline
    use "nvim-mini/mini.nvim"

    -- Gitsigns
    use {
        'lewis6991/gitsigns.nvim',
        requires = { "nvim-lua/plenary.nvim" }
    }

    -- Lsp and Mason
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'

    -- Harpoon
    use {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
    }

    -- Fugitive
    use 'tpope/vim-fugitive'

    -- LSP Completion (blink.cmp)
    use {
        'saghen/blink.cmp',
        tag = 'v1.10.2',
    }

    -- Autopairs
    use 'windwp/nvim-autopairs'
end)
