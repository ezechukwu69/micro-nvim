return {
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        keys = {
            { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Toggle trouble" },
            { "<leader>xw", "<cmd>Trouble diagnostics toggle<cr>", desc = "Workspace trouble" },
            { "<leader>xd", "<cmd>Trouble document_symbols toggle<cr>", desc = "Document trouble" },
            { "<leader>xq", "<cmd>Trouble quickfix toggle<cr>", desc = "Quickfix trouble" },
            { "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Loclist trouble" },
            { "<leader>xs", "<cmd>Trouble symbols toggle<cr>", desc = "Loclist trouble" },
            {"]t", function() require("trouble").next({skip_groups = true, jump = true}) end, desc = "Next trouble"},
            {"[t", function() require("trouble").previous({skip_groups = true, jump = true}) end, desc = "Previous trouble"},
        }
    }
}
