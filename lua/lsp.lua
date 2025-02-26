require('mason').setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	}
})

require('mason-lspconfig').setup({
	-- A list of servers to automatically install if they're not already installed
	ensure_installed = {
		'lua_ls',
		'terraformls',
		'tflint',
		'bashls',
		'elixirls',
		-- 'gopls',
		'html',
		'ltex',
		'sqlls',
		-- 'typescript-language-server'
	},
})

require('mason-lspconfig').setup_handlers({
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
})

