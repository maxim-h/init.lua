return {
    {
        'nvim-telescope/telescope.nvim',
        --version = '0.1.*',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
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

    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    },

    {
        "folke/trouble.nvim",
        dependencies = {
            {'nvim-tree/nvim-web-devicons'},
        },
        config = function()
            require("trouble").setup {
                icons = true,
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
        {"lewis6991/gitsigns.nvim", confing = function ()
            require('gitsigns').setup()
        end},
        {
            "nvim-treesitter/nvim-treesitter-context",
            config = function ()
                require('treesitter-context').setup {
                    max_lines = 4,
                    trim_scope = 'inner',
                    separator= '$',
                }
            end
        },

        {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v3.x',
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

        {
            "folke/zen-mode.nvim",
            dependencies = {
                {"folke/twilight.nvim"},
            }
        },
        {"github/copilot.vim"},
        { "CopilotC-Nvim/CopilotChat.nvim",
            branch = "canary",
            dependencies = {
                { "github/copilot.vim" }, -- or github/copilot.vim
                { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
            },
            opts = {
                debug = true, -- Enable debugging
            },
        },
        {"eandrju/cellular-automaton.nvim"},
        {"laytan/cloak.nvim"},
        {
            "norcalli/nvim-colorizer.lua"
        },
        {
            'snakemake/snakemake',
            config = function(plugin)
                vim.opt.rtp:append(plugin.dir .. "/misc/vim")
            end,
            ft = 'snakemake'
        },
    }
