return {
    {
        'akinsho/bufferline.nvim',
        version = "*",
        enabled = false,
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function ()
            require("bufferline").setup{
                options = {
                    mode = "tabs",
                    diagnostics = "nvim_lsp",
                    indicator = {
                        style = 'underline'
                    },
                    separator_style = "slope",
                    show_tab_indicators = true,
                },
            }
            -- vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', { desc = "Next buffer" })
            -- vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', { desc = "Previous buffer" })
            vim.keymap.set('n', '<leader>bd', '<Cmd>bd | bp<CR>', { desc = "Delete buffer" })
            vim.keymap.set('n', '<leader>bD', '<Cmd>%bd | e#<CR>', { desc = "Delete all buffers" })
        end
    }
}
