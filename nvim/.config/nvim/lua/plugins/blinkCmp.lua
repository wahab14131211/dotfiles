return {
    "saghen/blink.cmp",
    event = "InsertEnter",
    version = "*", -- pin to latest release so the prebuilt Rust binary is used
    opts = {
        -- default preset matches the old nvim-cmp keymaps:
        --   <C-n>/<C-p> next/prev, <C-y> accept, <C-space> show/docs,
        --   <C-l>/<C-h> snippet forward/back
        keymap = { preset = "default" },
        sources = {
            default = { "lsp", "path", "snippets" },
        },
    },
}
