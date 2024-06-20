--Used for simple plugins which do not require additional configuration
return {
    "tpope/vim-surround",
    {
        "folke/todo-comments.nvim",
        event = "VimEnter",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = { signs = false },
    },
    { -- Collection of various small independent plugins/modules
        "echasnovski/mini.nvim",
        config = function()
            require("mini.surround").setup()
            local statusline = require("mini.statusline")
            statusline.setup()
            statusline.section_location = function()
                return "%2l/%2L:%-2v"
            end
            statusline.section_filename = function()
                return "%2t"
            end
        end,
    },
}
