return {
	{
		"2nthony/vitesse.nvim",
		dependencies = {
			"tjdevries/colorbuddy.nvim",
		},
		priority = 1000, -- make sure to load this before all other plugins
		config = function()
			require("vitesse").setup({
				comment_italics = true,
				transparent_background = false,
				transparent_float_background = true,
				reverse_visual = false,
				dim_nc = false,
				cmp_cmdline_disable_search_highlight_group = false,
				telescope_border_follow_float_background = false,
				lspsaga_border_follow_float_background = false,
				diagnostic_virtual_text_background = false,
			})
			vim.cmd([[colorscheme vitesse]])
		end,
	},
}
