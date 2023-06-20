return {
	"numToStr/Comment.nvim",
	event = "VeryLazy",
	opts = {
		opleader = {
			line = "gc",
			block = "gb",
		},
		mappings = {
            -- `gcc`               -> line-comment the current line
            -- `gcb`               -> block-comment the current line
            -- `gc[count]{motion}` -> line-comment the region contained in {motion}
            -- `gb[count]{motion}` -> block-comment the region contained in {motion}
			basic = true,

            -- `gco`, `gcO`, `gcA`
			extra = true,
		},
	},
}
