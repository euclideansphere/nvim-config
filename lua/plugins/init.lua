local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
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
	{
		'echasnovski/mini.comment',
		version = '*',
		config = function() require('mini.comment').setup() end
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"elixir",
					"vim",
					"markdown",
					"markdown_inline",
					"javascript",
					"typescript",
					"terraform",
					"yaml"
				},
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	-- lsp / dap / linter configurators
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	-- ale - asynchronous linting engine
	{ 'dense-analysis/ale', enabled = false },
	{ 'echasnovski/mini.clue', version = '*', },
	require('plugins.snacks'),
	{
		"nvim-tree/nvim-tree.lua",
		config = function() require('plugins.nvim-tree') end,
	},
})

