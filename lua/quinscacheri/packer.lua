return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }
    use('tpope/vim-surround')

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use({
        'sainnhe/everforest',
        as = 'everforest',
        config = function()
            vim.cmd('colorscheme everforest')
        end
    })

    use {
        'akinsho/bufferline.nvim',
        tag = "v3.*",
        requires = 'nvim-tree/nvim-web-devicons',
        config = function() require("bufferline").setup {} end
    }

    use {
        'numToStr/Comment.nvim'
    }

    use("p00f/nvim-ts-rainbow")

    use {
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
        config = function()
            vim.schedule(function()
                require("copilot").setup({
                    suggestion = {
                        auto_trigger = true,
                        keymap = {
                            accept = '<C-l>',
                        }
                    }
                })
            end)
        end,
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function() require("lualine").setup {} end
    }
end)
