return {
    {
        "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            { "SmiteshP/nvim-navic" },
            { "neovim/nvim-lspconfig" },
        },
        lazy = false,
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
                if client.server_capabilities.inlayHintProvider then
                    vim.lsp.buf.inlay_hint(bufnr)
                end
                local opts = { buffer = bufnr }
                vim.keymap.set('n', '<leader>cr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                -- vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
                -- vim.keymap.set('x', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
                vim.keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<cr>', opts)
                vim.keymap.set('x', '<leader>ca', '<cmd>Lspsaga code_action<cr>', opts)
                vim.keymap.set('n', '<leader>co', '<cmd>Lspsaga outline<cr>', opts)
                vim.keymap.set('n', '<leader>ck', '<cmd>Lspsaga peek_definition<cr>', opts)
                vim.keymap.set('n', '<leader>cf', '<cmd>lua vim.lsp.buf.format()<cr>', opts)
                vim.keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
                vim.keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
                vim.keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
                vim.keymap.set("n", "<leader>gs", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", opts)
                vim.keymap.set("n", "<leader>gw", "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>", opts)
                vim.keymap.set("n", "<leader>gh", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
                vim.keymap.set("n", "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
                vim.keymap.set("n", "<leader>ge", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
                vim.keymap.set("n", "<leader>gp", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
                vim.keymap.set("n", "<leader>gn", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
                vim.keymap.set('n', '<leader>gf', '<cmd>Lspsaga finder<cr>', opts)
                vim.keymap.set("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<cr>", opts)
            end)
                
                -- vim.keymap.set("t")
                vim.keymap.set('t',"<esc>", "<C-\\><C-n>", { desc = "Escape terminal mode" })
                vim.keymap.set('n',"<leader>gt", "<cmd>Lspsaga term_toggle<cr>")
                vim.keymap.set('n',"<C-t>", "<cmd>Lspsaga term_toggle<cr>")
                vim.keymap.set('t',"<C-t>", "<cmd>Lspsaga term_toggle<cr>")
        end
    }
}
