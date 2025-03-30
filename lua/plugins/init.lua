return {
	"ellisonleao/gruvbox.nvim",
	-- lua neovim typings
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {},
	},
	-- auto-completion engine
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
			"hrsh7th/cmp-buffer", -- buffer auto-completion
			"hrsh7th/cmp-path", -- path auto-completion
			"hrsh7th/cmp-cmdline", -- cmdline auto-completion
		},
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			table.insert(opts.sources, {
				name = "lazydev",
				group_index = 0, -- set group index to 0 to skip loading LuaLS completions
			})
		end,
	},
	-- mason installs lsp/dap/linter/etc
	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗"
				}
			}
		}
	},
	-- mason lsp autobindings
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			-- A list of servers to automatically install if they're not already installed
			ensure_installed = {
				'lua_ls',
				'terraformls',
				'tflint',
				'bashls',
				'elixirls',
				'html',
				'ltex',
				'sqlls',
				'ts_ls',
			},
			handlers = {
				function (server_name)
					require('lspconfig')[server_name].setup({})
				end,
				-- override
				['lua_ls'] = function()
					require('lspconfig').lua_ls.setup({
						settings = {
							Lua = {
								diagnostics = {
									globals = {'vim'}
								}
							}
						}
					})
				end
			}
		}
	},
	-- lsp
	"neovim/nvim-lspconfig",
	-- dap
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio"
		}
	},
	-- ale - asynchronous linting engine
	{ 'dense-analysis/ale', enabled = false },
	{ 'echasnovski/mini.clue', version = '*', },
}

