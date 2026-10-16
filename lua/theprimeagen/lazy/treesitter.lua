return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
        branch = "main",
		lazy = false,
		init = function()
			local parsers = {
				"lua",
				"vim",
				"vimdoc",
				"query",
				"javascript",
				"typescript",
				"tsx",
				"html",
				"css",
				"json",
				"gitignore",
				"go",
				"python",
				"r",
				"markdown",
				"rnoweb",
				"yaml",
				"csv",
				"latex",
			}

			local group = vim.api.nvim_create_augroup("ThePrimeagenTreesitter", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
				group = group,
				callback = function()
					if vim.bo.buftype ~= "" then
						return
					end

					pcall(vim.treesitter.start, 0)
				end,
			})

			vim.api.nvim_create_autocmd("User", {
				group = group,
				pattern = "VeryLazy",
				once = true,
				callback = function()
                    require('nvim-treesitter').setup({
                        ensure_installed = {
                            "lua", "vim", "vimdoc", "javascript", "typescript",
				            "r", "markdown", "rnoweb", "yaml", "csv", "latex"
                            -- Add any other languages you need
                        },
                        auto_install = true,  -- Automatically install missing parsers
                        highlight = { enable = true },
                        indent = { enable = true },
                    })
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		lazy = false,
		config = function()
			require("nvim-treesitter-textobjects").setup({
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
					},
				},
			})
		end,
	},
}
