return {
    { "sainnhe/everforest",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.everforest_background = "hard"
            vim.g.everforest_better_performance = 1
            vim.opt.termguicolors = true
            vim.cmd([[ colorscheme everforest ]]) --load the colorscheme here
        end,
    },
    { "folke/tokyonight.nvim", event = "User LazyColorscheme" },
    { "rebelot/kanagawa.nvim", event = "User LazyColorscheme" },
}
