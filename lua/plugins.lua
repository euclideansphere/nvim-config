local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath, })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"ellisonleao/gruvbox.nvim",
	-- Vscode-like pictograms
	{
		"onsails/lspkind.nvim",
		event = { "VimEnter" },
	},
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
		config = function()
			require("config.nvim-cmp")
		end,
	},
	-- Code snippet engine
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
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
	-- mason is a UI tool for managing lsps
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
		end,
	},
	-- ale - asynchronous linting engine
	{
		'dense-analysis/ale',
		enabled = false
	},
	-- file explorer
	'nvim-tree/nvim-web-devicons',
	{
		'nvim-tree/nvim-tree.lua',
		lazy = true,
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
	},
	{
		'echasnovski/mini.clue',
		version = false
	},
	-- fzf
	{
		"ibhagwan/fzf-lua",
		config = function()
			require("fzf-lua").setup({
				winopts = {
					-- rounded borders in vim is like adding a 2ft spoiler to a volvo
					-- why is this plugin so busted wtf
					-- rounded corners:
					-- border = "solid"
					-- fucked up layout
					-- border = {" "},
					-- only thing that doesnt result in fucked up layout or rounded corners:
					border = "none",
					preview = {
						border = "none"
					}
				},
				files = {
					file_icons = false
				}
			})
		end
	},
	require('plugins.snacks')
})

require("nvim-tree").setup({
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
		icons = {
			show = {
				file = false,
				folder = false,
				git = false,
				bookmarks = false,
				diagnostics = false,
			},
			glyphs = {
				folder = {
					arrow_open = "<",
					arrow_closed = ">",
				}
			},
		}
	},
	filters = {
		-- custom = { "^.git$" }
	},
})

