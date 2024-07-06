return {
    {
        "coffebar/neovim-project",
        enabled = false,
        opts = {
            projects = { -- define project roots
                "~/Development/flutter/*",
                "~/Development/java/*",
                "~/Development/phoenix/*",
                "~/Development/Web/lendville-admin.git/testing",
                "~/Development/Web/lendville-admin.git/main",
                "~/.config/*",
            },
        },
        init = function()
            -- enable saving the state of plugins in the session
            vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
        end,
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
            { "Shatur/neovim-session-manager" },
        },
        keys = {
            { "<leader>fd", "<cmd>Telescope neovim-project discover<cr>" },
            { "<leader>fp", "<cmd>Telescope neovim-project history<cr>" },
        },
        lazy = false,
        priority = 100,
    },
}
