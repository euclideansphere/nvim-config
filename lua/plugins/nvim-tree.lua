return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		local function on_attach(bufnr)
			local api = require("nvim-tree.api")

			api.config.mappings.default_on_attach(bufnr)

			-- your removals and mappings go here
			vim.keymap.set('n', '<leader>F', function()
				api.tree.find_file({ open = true, focus = true })
			end, { noremap = true })
		end

		require("nvim-tree").setup({
			view = {
				float = {
					enable = true,
					open_win_config = function()
						local screen_w = vim.opt.columns:get()
						-- local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
						local w_h = 70
						local s_h = 42
						local center_x = (screen_w - w_h) / 2
						local center_y = ((vim.opt.lines:get() - s_h) / 5) - vim.opt.cmdheight:get()
						return {
							border = "none",
							relative = "editor",
							row = center_y,
							col = center_x,
							width = w_h,
							height = s_h,
						}
					end,
				},
				width = function()
					return math.floor(vim.opt.columns:get() * 5)
				end,
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
	end
}

