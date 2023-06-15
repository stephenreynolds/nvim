-- Harpoon: Getting you where you want with the fewest keystrokes.
return {
	"ThePrimeagen/harpoon",
	depencencies = { "nvim-lua/plenary.nvim" },
	config = function()
		vim.api.nvim_create_autocmd({ "Filetype" }, {
			pattern = "harpoon",
			callback = function()
				vim.opt.cursorline = true
				vim.api.nvim_set_hl(0, "HarpoonWindow", { link = "Normal" })
				vim.api.nvim_set_hl(0, "HarpoonBorder", { link = "Normal" })
			end,
		})
	end,
	keys = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")
		return {
			{
				"<leader>a",
				function()
					mark.add_file()
					print("Added to harpoon.")
				end,
				desc = "Add to harpoon",
			},
			{
				"<C-e>",
				ui.toggle_quick_menu,
				desc = "Harpoon quick menu",
			},
			{
				"<C-left>",
				function()
					ui.nav_file(1)
				end,
				desc = "Go to quick file 1",
			},
			{
				"<C-down>",
				function()
					ui.nav_file(2)
				end,
				desc = "Go to quick file 2",
			},
			{
				"<C-up>",
				function()
					ui.nav_file(3)
				end,
				desc = "Go to quick file 3",
			},
			{
				"<C-right>",
				function()
					ui.nav_file(4)
				end,
				desc = "Go to quick file 4",
			},
		}
	end,
}
