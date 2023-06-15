COLORSCHEME = "catppuccin"

local function setup_tokyo_night()
	require("tokyonight").setup({
		style = "night",
		transparent = true,
	})
end

local function setup_catppuccin()
	local catppuccin = require("catppuccin")
	catppuccin.setup({
		flavour = "mocha",
		transparent_background = true,
		integrations = {
			alpha = true,
			gitsigns = true,
			harpoon = true,
			markdown = true,
			mason = true,
			noice = true,
			cmp = true,
			dap = {
				enabled = true,
				enable_ui = true,
			},
			fidget = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
				},
				underlines = {
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
				},
			},
			neotest = true,
			notify = true,
			overseer = true,
			semantic_tokens = true,
			treesitter = true,
			treesitter_context = true,
			telescope = true,
			lsp_trouble = true,
			which_key = true,
		},
	})
	catppuccin.compile()
end

local function setup_kanagawa()
	require("kanagawa").setup({
		transparent = true,
		undercurl = true,
		background = {
			dark = "wave",
		},
		colors = {
			theme = {
				all = {
					ui = {
						bg_gutter = "none",
					},
				},
			},
		},
		overrides = function(colors)
			local theme = colors.theme
			return {
				NormalFloat = { bg = "none" },
				FloatBorder = { bg = "none" },
				FloatTitle = { bg = "none" },

				-- Save an hlgroup with dark background and dimmed foreground
				-- so that you can use it where your still want darker windows.
				-- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
				NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

				-- Popular plugins that open floats will link to NormalFloat by default;
				-- set their background accordingly if you wish to keep them dark and borderless
				LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
				MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

				TelescopeTitle = { fg = theme.ui.special, bold = true },
				TelescopePromptNormal = { bg = theme.ui.bg_p1 },
				TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
				TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
				TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
				TelescopePreviewNormal = { bg = theme.ui.bg_dim },
				TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

				Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
				PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
				PmenuSbar = { bg = theme.ui.bg_m1 },
				PmenuThumb = { bg = theme.ui.bg_p2 },
			}
		end,
	})
end

local function setup_rose_pine()
	require("rose-pine").setup({})
end

local color_scheme_dispatch = {
	catppuccin = setup_catppuccin,
	kanagawa = setup_kanagawa,
	["rose-pine"] = setup_rose_pine,
	tokyonight = setup_tokyo_night,
}

local function set_color_scheme(color_scheme)
	local set_func = color_scheme_dispatch[color_scheme]
	if set_func then
		set_func()
		vim.cmd("colorscheme " .. color_scheme)
	else
		error("Invalid color scheme: " .. color_scheme)
	end
end

set_color_scheme(COLORSCHEME)
