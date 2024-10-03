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
        -- config = function()
        --     require("trouble").setup {
        --         icons = true,
        --         -- your configuration comes here
        --         -- or leave it empty to {the default settings},
        --         -- refer to the configuration section below
        --     }
        -- end
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
    {
        "tpope/vim-commentary"
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
                {'neovim/nvim-lspconfig',
                dependencies = {
                    { -- nice loading notifications
                        -- PERF: but can slow down startup
                        'j-hui/fidget.nvim',
                        enabled = true,
                        opts = {},
                    },
                }
            },
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
        -- {"github/copilot.vim"},
        -- { "CopilotC-Nvim/CopilotChat.nvim",
        --     branch = "canary",
        --     dependencies = {
        --         { "github/copilot.vim" }, -- or github/copilot.vim
        --         { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
        --     },
        --     opts = {
        --         debug = true, -- Enable debugging
        --     },
        -- },
        {'rcarriga/nvim-notify'},
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
        {
            "quarto-dev/quarto-nvim",
            dependencies = {
                "jmbuhr/otter.nvim",
                "nvim-treesitter/nvim-treesitter",
                { -- send code from python/r/qmd documets to a terminal or REPL
                    -- like ipython, R, bash
                    'jpalardy/vim-slime',
                    dev = false,
                    init = function()
                        vim.b['quarto_is_python_chunk'] = false
                        Quarto_is_in_python_chunk = function()
                            require('otter.tools.functions').is_otter_language_context 'python'
                        end

                        vim.cmd [[
                        let g:slime_dispatch_ipython_pause = 100
                        function SlimeOverride_EscapeText_quarto(text)
                            call v:lua.Quarto_is_in_python_chunk()
                            if exists('g:slime_python_ipython') && len(split(a:text,"\n")) > 1 && b:quarto_is_python_chunk && !(exists('b:quarto_is_r_mode') && b:quarto_is_r_mode)
                                return ["%cpaste -q\n", g:slime_dispatch_ipython_pause, a:text, "--", "\n"]
                            else
                                if exists('b:quarto_is_r_mode') && b:quarto_is_r_mode && b:quarto_is_python_chunk
                                    return [a:text, "\n"]
                                else
                                    return [a:text]
                                end
                            end
                            endfunction
                            ]]

                            vim.g.slime_target = 'neovim'
                            vim.g.slime_no_mappings = true
                            vim.g.slime_python_ipython = 1
                        end,
                        config = function()
                            vim.g.slime_input_pid = false
                            vim.g.slime_suggest_default = true
                            vim.g.slime_menu_config = false
                            vim.g.slime_neovim_ignore_unlisted = true

                            local function mark_terminal()
                                local job_id = vim.b.terminal_job_id
                                vim.print('job_id: ' .. job_id)
                            end

                            local function set_terminal()
                                vim.fn.call('slime#config', {})
                            end
                            vim.keymap.set('n', '<leader>cm', mark_terminal, { desc = '[m]ark terminal' })
                            vim.keymap.set('n', '<leader>cs', set_terminal, { desc = '[s]et terminal' })
                        end,
                    },

                },
            },
            {
                "vapourlang/vapour-nvim",
                config = function()
                    require("vapour").setup()
                end
            },
    }
