return {
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
	end
}

