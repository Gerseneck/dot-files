vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'
    use 'nvim-tree/nvim-tree.lua'
    use 'lifepillar/pgsql.vim'
    use 'nvim-tree/nvim-web-devicons'
    use 'tamton-aquib/staline.nvim'
    use 'ap/vim-css-color'
    use 'ryanoasis/vim-devicons'
    use 'preservim/tagbar'
    use 'terryma/vim-multiple-cursors'
    use 'vimlab/split-term.vim'
    use 'lewis6991/gitsigns.nvim'
    use { 'kylechui/nvim-surround', tag = '*' }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup {} end
    }

    use {
        'nanotech/jellybeans.vim',
        as = 'jellybeans',
        config = function()
            vim.cmd('colorscheme jellybeans')
        end
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }

end)
