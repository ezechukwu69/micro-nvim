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
            { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Toggle trouble" },
            { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace trouble" },
            { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document trouble" },
            { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix trouble" },
            { "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Loclist trouble" },
            {"]t", function() require("trouble").next({skip_groups = true, jump = true}) end, desc = "Next trouble"},
            {"[t", function() require("trouble").previous({skip_groups = true, jump = true}) end, desc = "Previous trouble"},
        }
    }
}
