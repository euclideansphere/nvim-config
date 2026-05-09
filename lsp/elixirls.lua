return {
	cmd = { "elixir-ls" },
	filetypes = { "elixir", "eelixir", "heex", "surface" },
	root_markers = { "mix.exs", ".git" },
	settings = {
		elixirLS = {
			dialyzerEnabled = false,
			fetchDeps = false,
		}
	}
}
