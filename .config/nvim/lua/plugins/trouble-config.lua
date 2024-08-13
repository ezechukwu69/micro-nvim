return {
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            -- Window options for the preview window. Can be a split, floating window,
  -- or `main` to show the preview in the main editor window.
            ---@type trouble.Window.opts
            win = {
                type = "split"
            },
            focus = true,
            auto_jump = true,
        },
        keys = {
            { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",                     desc = "Toggle trouble" },
            { "<leader>xw", "<cmd>Trouble diagnostics toggle<cr>",                     desc = "Workspace trouble" },
            { "<leader>xd", "<cmd>Trouble document_symbols toggle<cr>",                desc = "Document trouble" },
            { "<leader>xq", "<cmd>Trouble quickfix toggle<cr>",                        desc = "Quickfix trouble" },
            { "<leader>xl", "<cmd>Trouble loclist toggle<cr>",                         desc = "Loclist trouble" },
            { "<leader>xs", "<cmd>Trouble symbols toggle<cr>",                         desc = "Loclist trouble" },
            { "]x",         function() require("trouble").next("diagnostics") end,     desc = "Next trouble" },
            { "[x",         function() require("trouble").previous("diagnostics") end, desc = "Previous trouble" },
        }
    }
}
