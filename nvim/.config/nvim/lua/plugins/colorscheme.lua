return {
	{
		--plugin for everforest colorscheme
		"sainnhe/everforest",
		priority = 1000, --make sure to load this before all other plugins
		config = function()
			vim.g.everforest_background = "soft"
			vim.g.everforest_better_performance = 1
			--vim.cmd([[ colorscheme everforest ]]) --load the colorscheme here
		end,
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000, --make sure to load this before all other plugins
		config = function()
			--require("lualine").setup({ theme = "tokyonight-storm" })
			vim.cmd([[ colorscheme tokyonight-storm ]]) --load the colorscheme here
		end,
	},
}
