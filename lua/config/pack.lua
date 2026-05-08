local M = {}

function M.setup()
	-- 1. Plugin Registration
	local plugins = {
		{ src = "https://github.com/ellisonleao/gruvbox.nvim" },
		{ src = "https://github.com/folke/lazydev.nvim" },
		{ src = "https://github.com/williamboman/mason.nvim" },
		{ src = "https://github.com/williamboman/mason-lspconfig.nvim" },
		{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
		{ src = "https://github.com/mfussenegger/nvim-dap" },
		{ src = "https://github.com/nvim-neotest/nvim-nio" },
		{ src = "https://github.com/rcarriga/nvim-dap-ui" },
		{ src = "https://github.com/nvim-lualine/lualine.nvim" },
		{ src = "https://github.com/ibhagwan/fzf-lua" },
		{ src = "https://github.com/echasnovski/mini.surround" },
	}

	vim.pack.add(plugins)

	-- 2. Core UI & Theme
	vim.cmd("colorscheme gruvbox")

	require("lualine").setup({
		options = {
			icons_enabled = false,
			theme = 'gruvbox_dark',
			component_separators = { left = '', right = '' },
			section_separators = { left = '', right = '' },
			globalstatus = false,
		},
		sections = {
			lualine_a = { 'mode' },
			lualine_b = { 'branch', 'diff', 'diagnostics' },
			lualine_c = { 'filename' },
			lualine_x = { 'encoding', 'fileformat', 'filetype' },
			lualine_y = { 'progress' },
			lualine_z = { 'location' }
		}
	})

	-- 3. LSP & Tool Configuration
	require("lazydev").setup({})
	
	require("mason").setup({
		ui = { icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" } }
	})

	require("mason-lspconfig").setup({})
	
	require("mason-tool-installer").setup({
		ensure_installed = {
			'lua-language-server',
			'elixir-ls',
			'terraform-ls',
			'bash-language-server',
			'html-lsp',
			'sqlls',
			'typescript-language-server'
		}
	})

	-- Native 0.12 way to enable servers
	vim.lsp.enable({ 'lua_ls', 'elixirls', 'terraformls', 'bashls', 'html', 'sqlls', 'ts_ls' })

	vim.api.nvim_create_autocmd('LspAttach', {
		callback = function(args)
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			if client and client.supports_method('textDocument/completion') then
				vim.lsp.completion.enable(true, client.id)
			end
		end,
	})

	-- 4. Treesitter Configuration
	vim.api.nvim_create_autocmd('FileType', {
		callback = function()
			if vim.treesitter.language.get_lang(vim.bo.filetype) then
				pcall(vim.treesitter.start)
			end
		end,
	})

	-- 5. Utilities & Keymaps
	require("fzf-lua").setup({
		"fzf-native",
		winopts = {
			height = 0.85, width = 0.80, row = 0.35, col = 0.50,
			border = 'single', 
			preview = { border = 'single', layout = 'vertical', vertical = 'down:45%' },
		},
		files = { formatter = "path.filename_first" },
	})

	require("mini.surround").setup({
		mappings = {
			add = 'sa', delete = 'sd', find = 'sf', find_left = 'sF',
			highlight = 'sh', replace = 'sr', update_n_lines = 'sn',
		},
	})

	local map = vim.keymap.set
	map('n', 'gd', '<C-]>', { desc = "Goto Definition" })
	map('n', '<leader><space>', function() require('fzf-lua').files() end, { desc = "FZF Files" })
	map('n', '<leader>/', function() require('fzf-lua').live_grep() end, { desc = "FZF Grep" })
	map('n', '<leader>,', function() require('fzf-lua').buffers() end, { desc = "FZF Buffers" })
	map('n', '<leader>sd', function() require('fzf-lua').diagnostics_workspace() end, { desc = "FZF Diagnostics" })
	map('n', '<leader>bd', ':bd<CR>', { silent = true, desc = "Delete Buffer" })
	map('n', '<leader>F', ':Lexplore %:p:h<CR>', { silent = true, desc = "Explorer at File" })
	map('n', '<leader>e', ':Lexplore<CR>', { silent = true, desc = "Toggle Explorer" })
	map('n', '<leader>?', ':map <leader><CR>', { desc = "Discover Leader Maps" })
end

return M
