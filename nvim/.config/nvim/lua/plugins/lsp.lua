return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        { "mason-org/mason-lspconfig.nvim",
            opts = {
                ensure_installed = { "lua_ls", "clangd", "bashls", "pyright", "perlnavigator" },
            },
        },
        { "folke/lazydev.nvim", ft = "lua", opts = {} },
    },
    config = function()
        -- Broadcast blink.cmp completion capabilities to every server.
        vim.lsp.config("*", {
            capabilities = require("blink.cmp").get_lsp_capabilities(),
        })

        -- Extra keymaps on top of the 0.11 LSP defaults
        -- (K, grn, gra, grr, gri, gO, <C-W>d are built-in).
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("user-lsp-attach", { clear = true }),
            callback = function(event)
                local map = function(keys, func, desc)
                    vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end
                local builtin = require("telescope.builtin")

                -- Telescope-flavored pickers (nicer UI than the built-in defaults).
                map("gd", builtin.lsp_definitions, "[G]oto [D]efinition")
                map("gr", builtin.lsp_references, "[G]oto [R]eferences")
                map("gI", builtin.lsp_implementations, "[G]oto [I]mplementation")
                map("<leader>D", builtin.lsp_type_definitions, "Type [D]efinition")
                map("<leader>ds", builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
                map("<leader>ws", builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
                map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

                -- Toggle inlay hints if the server supports them.
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and client:supports_method("textDocument/inlayHint") then
                    map("<leader>th", function()
                        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                    end, "[T]oggle Inlay [H]ints")
                end
            end,
        })
    end,
}
