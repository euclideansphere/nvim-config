
local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	api.config.mappings.default_on_attach(bufnr)

	-- your removals and mappings go here
	vim.keymap.set('n', '<leader>ff', api.tree.find_file, opts('focus file'))
end

require("nvim-tree").setup({
	view = {
		width = 30,
	},
	renderer = {
		group_empty = false,
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
	on_attach = on_attach
})
