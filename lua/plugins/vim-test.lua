return {
	"vim-test/vim-test",
	opts = {
		setup = {},
	},
	config = function(plugin, opts)
		vim.g["test#strategy"] = "neovim"
		vim.g["test#neovim#term_position"] = "belowright"
		vim.g["test#neovim#preserve_screen"] = 1

		-- Set up vim-test
		for k, _ in pairs(opts.setup) do
			opts.setup[k](plugin, opts)
		end
	end,
}
