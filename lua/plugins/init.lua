return {
	"ellisonleao/gruvbox.nvim",
	-- Auto-completion engine
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
			"hrsh7th/cmp-buffer", -- buffer auto-completion
			"hrsh7th/cmp-path", -- path auto-completion
			"hrsh7th/cmp-cmdline", -- cmdline auto-completion
		},
		config = function() require("config.nvim-cmp") end,
	},
	-- lsp / dap / linter configurators
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	-- ale - asynchronous linting engine
	{ 'dense-analysis/ale', enabled = false },
	{ 'echasnovski/mini.clue', version = '*', },
}

