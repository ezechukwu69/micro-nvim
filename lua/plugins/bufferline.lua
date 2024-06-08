return {
    {
        'akinsho/bufferline.nvim',
        version = "*",
        enabled = true,
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("bufferline").setup {
                highlights = {
                    fill = { bg = '#000000' },
                    buffer_selected = { bold = true },
                    diagnostic_selected = { bold = true },
                    info_selected = { bold = true },
                    info_diagnostic_selected = { bold = true },
                    warning_selected = { bold = true },
                    warning_diagnostic_selected = { bold = true },
                    error_selected = { bold = true },
                    error_diagnostic_selected = { bold = true },
                },
                options = {
                    show_close_icon = false,
                    diagnostics = 'nvim_lsp',
                    max_prefix_length = 8,
                    -- indicator = { icon = '▎', style = 'underline' },
                },
            }
            -- vim.keymap.set('n', '"Tab"', '<Cmd>BufferLineCycleNext<CR>', { desc = "Next buffer" })
            -- vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', { desc = "Previous buffer" })
            vim.keymap.set('n', '<leader>bd', '<Cmd>bd | bp<CR>', { desc = "Delete buffer" })
            vim.keymap.set('n', '<leader>bD', '<Cmd>%bd | e#<CR>', { desc = "Delete all buffers" })
        end
    }
}
