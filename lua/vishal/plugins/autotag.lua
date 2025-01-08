-- lua/vishal/plugins/autotag.lua
return {
	"windwp/nvim-ts-autotag",
	dependencies = "nvim-treesitter/nvim-treesitter",
	ft = {
		"html",
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
		"svelte",
		"vue",
		"tsx",
		"jsx",
		"rescript",
		"xml",
		"php",
		"markdown",
		"astro",
		"glimmer",
		"handlebars",
		"hbs",
	},
	config = function()
		require("nvim-ts-autotag").setup({
			autotag = {
				enable = true,
				enable_rename = true,
				enable_close = true,
				enable_close_on_slash = true,
			},
		})

		-- Force enable the module
		vim.api.nvim_create_autocmd({ "FileType" }, {
			pattern = {
				"html",
				"javascript",
				"typescript",
				"javascriptreact",
				"typescriptreact",
				"svelte",
				"vue",
				"tsx",
				"jsx",
				"rescript",
				"xml",
				"php",
				"markdown",
				"astro",
				"glimmer",
				"handlebars",
				"hbs",
			},
			callback = function()
				if not vim.b.ts_autotag_setup then
					vim.b.ts_autotag_setup = true
					require("nvim-ts-autotag").setup_buffer()
				end
			end,
		})
	end,
}
