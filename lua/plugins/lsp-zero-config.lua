return {
    {
        "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            { "SmiteshP/nvim-navic" },
            { "neovim/nvim-lspconfig" },
        },
        config = function()
            local lsp_zero = require('lsp-zero').preset({})
            local navic = require("nvim-navic")
            lsp_zero.extend_lspconfig()
            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({ buffer = bufnr })
                if client.server_capabilities.documentSymbolProvider then
                    navic.attach(client, bufnr)
                end
                local opts = { buffer = bufnr }
                vim.keymap.set('n', '<leader>cr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
                vim.keymap.set('x', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
                vim.keymap.set('n', '<leader>cf', '<cmd>lua vim.lsp.buf.format()<cr>', opts)
            end)
        end
    }
}
