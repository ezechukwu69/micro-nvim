return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            { "williamboman/mason-lspconfig.nvim" },
            { "neovim/nvim-lspconfig" },
            { "VonHeikemen/lsp-zero.nvim" },
            { "folke/neodev.nvim" },
        },
        lazy = false,
        config = function()
            local lsp_zero = require("lsp-zero")
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
                    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                end
                local opts = { buffer = bufnr }
                vim.keymap.set('n', '<leader>cr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
                vim.keymap.set('x', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
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
                vim.keymap.set("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<cr>", opts)
            end)
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "emmet_ls", "jdtls", "java-debug-adapter", "java-test" },
                handlers = {
                    lsp_zero.default_setup
                }
            })
            require("lspconfig").zls.setup({})
            require("lspconfig").emmet_ls.setup({
                filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "heex", 'ex', "html", "jsx", "tsx" },
            })
            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'Enable inlay hints',
                callback = function(event)
                    local id = vim.tbl_get(event, 'data', 'client_id')
                    local client = id and vim.lsp.get_client_by_id(id)
                    if client == nil or not client.supports_method('textDocument/inlayHint') then
                        return
                    end

                    -- warning: this api is not stable yet
                    vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
                end,
            })
        end
    },
}
