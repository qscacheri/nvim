require("lazy").setup({
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

    {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        dependencies = { { 'nvim-lua/plenary.nvim' } },
    },

    { 'nvim-treesitter/nvim-treesitter',
        run = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end
    },

    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
    },

    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
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
        },
    },
    { 'tpope/vim-surround' },

    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        lazy = false,
        priority = 1000
    },

    {
        'akinsho/bufferline.nvim',
    },

    {
        'numToStr/Comment.nvim'
    },

    { "p00f/nvim-ts-rainbow" },

    {
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
        config = function()
            vim.schedule(function()
                require("copilot").setup({
                    suggestion = {
                        auto_trigger = true,
                        keymap = {
                            accept = '<C-l>',
                        },
                    },
                })
            end)
        end,
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function()
            require("lualine").setup {
                theme = "nord"
            }
        end
    },

    { 'theprimeagen/harpoon' },

    { 'mbbill/undotree' },

    -- {
    --     "ray-x/lsp_signature.nvim",
    -- },

    {
        "norcalli/nvim-colorizer.lua",
    },
    {
        "isobit/vim-caddyfile"
    },

    {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup {}
        end
    },
    {
        "JoosepAlviste/nvim-ts-context-commentstring"
    },
    {
        "windwp/nvim-ts-autotag"
    },
    {
        "ggandor/leap.nvim",
        dependencies = {
            "tpope/vim-repeat",
        },
        config = function()
            require("leap").add_default_mappings()
        end
    },
    { "tpope/vim-fugitive" },

    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require("treesitter-context").setup {
                enable = true,
            }
        end
    },
    { "jparise/vim-graphql" },
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    {
        "shaunsingh/nord.nvim"
    },
    {
        "tpope/vim-unimpaired"
    },
    { "windwp/nvim-spectre" },
    { "Mxrcon/nextflow-vim" },
})
