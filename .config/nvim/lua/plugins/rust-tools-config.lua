return {
    {
        "simrat39/rust-tools.nvim",
        config = function()
            local rt = require("rust-tools")
            rt.setup({
                server = {
                    on_attach = function(_, bufnr)
                        -- Hover actions

                        vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
                        -- Code action groups
                        vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
                        local lsp_zero = require("lsp-zero")
                        lsp_zero.extend_lspconfig()
                        lsp_zero.default_keymaps({ buffer = bufnr })
                        vim.cmd [[
                            nnoremap ga <Cmd>lua vim.lsp.buf.code_action()<CR>
                        ]]
                    end,
                },
            })
        end
    }
}
