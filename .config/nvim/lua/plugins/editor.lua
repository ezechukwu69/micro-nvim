return {
    -- Session
    {
        "folke/persistence.nvim",
        event = "BufReadPre", -- this will only start session saving when an actual file was opened
        opts = {
            -- add any custom options here
        },
        init = function()
            -- load the session for the current directory
            vim.keymap.set("n", "<leader>ss", function() require("persistence").load() end, { desc = "Load session" })

            -- select a session to load
            vim.keymap.set("n", "<leader>sS", function() require("persistence").select() end, { desc = "Select session" })

            -- load the last session
            vim.keymap.set("n", "<leader>sl", function() require("persistence").load({ last = true }) end,
                { desc = "Load last session" })

            -- stop Persistence => session won't be saved on exit
            vim.keymap.set("n", "<leader>sd", function() require("persistence").stop() end, { desc = "Stop Persistence" })
        end
    },
    -- Search and replace
    {
        'MagicDuck/grug-far.nvim',
        config = function()
            require('grug-far').setup({
                engine = 'ripgrep'
            });

            vim.keymap.set('n', '<leader>fr', function()
                require('grug-far').grug_far()
            end, { desc = "Search with grug-far" })

            vim.keymap.set('v', '<leader>fr', function()
                require('grug-far').with_visual_selection()
            end, { desc = "Search with grug-far" })
        end
    },
    -- TODO comments
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
        },
        config = function(opts)
            require("todo-comments").setup(opts)
            vim.keymap.set("n", "]t", function()
                require("todo-comments").jump_next()
            end, { desc = "Next todo comment" })

            vim.keymap.set("n", "[t", function()
                require("todo-comments").jump_prev()
            end, { desc = "Previous todo comment" })
        end
    },
    -- For lua lsp cmp
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },
    { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings

    -- FZF
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            { "<leader>ff",       "<cmd>FzfLua files<cr>" },
            { "<leader><leader>", "<cmd>FzfLua files<cr>" },
            { "<leader>f/",       "<cmd>FzfLua live_grep<cr>" },
            { "<leader>fb",       "<cmd>FzfLua buffers<cr>" },
            { "<leader>fh",       "<cmd>FzfLua helptags<cr>" },
            { "<leader>fc",       "<cmd>FzfLua commands<cr>" },
            { "<leader>fg",       "<cmd>FzfLua git_files<cr>" },
            { "<leader>fs",       "<cmd>FzfLua git_status<cr>" },
        },
        lazy = false,
        config = function()
            -- calling `setup` is optional for customization
            require("fzf-lua").setup({})
            vim.keymap.set('n', '<leader>fz', "<cmd>FzfLua<cr>", { desc = "FZF" })
        end
    },
    {
        'stevearc/overseer.nvim',
        opts = {},
        config = function(opts)
            require('overseer').setup(opts)
            require("which-key").add({ { "<LEADER>tt", group = "T (tasks)" } }, { prefix = "<LEADER>" })
            vim.keymap.set('n', '<leader>ttr', "<cmd>OverseerRun<cr>", { desc = "Run Task" })
            vim.keymap.set('n', '<leader>ttt', "<cmd>OverseerToggle<cr>", { desc = "Toggle Tasks" })
        end
    },
    {
        "ahmedkhalf/project.nvim",
        opts = {
            manual_mode = true,
        },
        dependencies = {
            "ibhagwan/fzf-lua",
        },
        lazy = false,
        config = function(_, opts)
            require("project_nvim").setup(opts)
            require("telescope").load_extension("projects")
            local project_nvim = require("project_nvim")
            vim.keymap.set("n", "<leader>fp", "<cmd>Telescope projects<cr>", { desc = "Find Project" })
        end,
    }
}
