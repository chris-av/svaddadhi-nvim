return {
	{
		"folke/tokyonight.nvim",
		priority = 1000, -- make sure to load this before all other plugins
		lazy = false,
		config = function()
			require("tokyonight").setup({
				-- use the day style
				style = "day",
				-- disable italic for functions
				styles = {
					functions = {},
				},
				-- Change the "hint" color to the "orange" color, and make the "error" color bright red
				on_colors = function(colors)
					colors.hint = "#118c74"
					colors.error = "#c64343"
				end,
				-- The missing required fields:
				on_highlights = function(hl, c)
					-- You can add custom highlights here if needed
				end,
				light_style = "day", -- The light style to use
				transparent = false, -- Enable this to disable setting the background color
				terminal_colors = true, -- Configure the colors used when opening a `:terminal`
				day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style
				dim_inactive = false, -- dims inactive windows
				lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
				cache = true, -- Cache the results of `on_highlights` and `on_colors` if `cache` is `true`
				plugins = { -- Enable integrated plugins by setting them to true
					-- Some examples of plugins you might use:
					gitsigns = true,
					indent_blankline = true,
					nvim_cmp = true,
					nvim_tree = true,
					telescope = true,
					treesitter = true,
				},
			})
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
}
