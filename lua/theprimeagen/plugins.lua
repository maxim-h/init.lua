return {
    {
        'nvim-telescope/telescope.nvim', version = '0.1.0',
        -- or                            , branch = '0.1.x',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },

    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000 ,
        config = function()
            vim.cmd('set background=dark')
            vim.cmd('colorscheme gruvbox')
        end,
        opts = ...
    },

--    {
--        'rose-pine/neovim',
--        name = 'rose-pine',
--        config = function()
--            vim.cmd('colorscheme rose-pine')
--        end
--    },

    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false,
                -- your configuration comes here
                -- or leave it empty to {the default settings},
                -- refer to the configuration section below
            }
        end
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,},
        {"nvim-treesitter/playground"},
        {"theprimeagen/harpoon"},
        {"theprimeagen/refactoring.nvim"},
        {"mbbill/undotree"},
        {"tpope/vim-fugitive"},
        {"nvim-treesitter/nvim-treesitter-context"},

        {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v1.x',
            dependencies = {
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
        },

        {"folke/zen-mode.nvim"},
        {"github/copilot.vim"},
        {"eandrju/cellular-automaton.nvim"},
        {"laytan/cloak.nvim"},
    }
