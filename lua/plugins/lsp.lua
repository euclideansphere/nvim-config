

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('lua-lanugage-server', {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method('textDocument/implementation') then
			-- Create a keymap for vim.lsp.buf.implementation ...
		end

		-- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
		if client:supports_method('textDocument/completion') then
			-- Optional: trigger autocompletion on EVERY keypress. May be slow!
			local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
			client.server_capabilities.completionProvider.triggerCharacters = chars

			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end

		-- Auto-format ("lint") on save.
		-- Usually not needed if server supports "textDocument/willSaveWaitUntil".
		if not client:supports_method('textDocument/willSaveWaitUntil')
			and client:supports_method('textDocument/formatting') then
			vim.api.nvim_create_autocmd('BufWritePre', {
				group = vim.api.nvim_create_augroup('lua-language-server', { clear = false }),
				buffer = args.buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
				end,
			})
		end
	end,
})

return {
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
				'sqlls',
				'ts_ls',
			},
			handlers = {
				function (server_name)
					require('lspconfig')[server_name].setup({})
				end,
				['lua_ls'] = function()
					vim.lsp.config['lua-language-server'] = {
						cmd = { "lua-language-server" },
						root_markers = { "luarc.lua", ".luarc.json" },
						filetypes = { "lua" },
						-- on_init = function (client)
						-- 	local path = vim.tbl_get(client, "workspace_folders", 1, "name")
						-- 	if not path then
						-- 		return
						-- 	end
						-- 	-- override the lua-language-server settings for Neovim config
						-- 	client.settings = vim.tbl_deep_extend('force', client.settings, {
						-- 		Lua = {
						-- 			runtime = {
						-- 				version = 'LuaJIT'
						-- 			},
						-- 			-- Make the server aware of Neovim runtime files
						-- 			workspace = {
						-- 				checkThirdParty = false,
						-- 				library = {
						-- 					vim.env.VIMRUNTIME
						-- 					-- Depending on the usage, you might want to add additional paths here.
						-- 					-- "${3rd}/luv/library"
						-- 					-- "${3rd}/busted/library",
						-- 				}
						-- 				-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
						-- 				-- library = vim.api.nvim_get_runtime_file("", true)
						-- 			}
						-- 		}
						-- 	})
						-- end
					}
				end
			}
		}
	},
	"neovim/nvim-lspconfig",
}
