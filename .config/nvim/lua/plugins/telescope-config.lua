return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        -- or                              , branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            "nvim-telescope/telescope-file-browser.nvim",
            'nvim-telescope/telescope-ui-select.nvim'
        },
        cmd = "Telescope",
        opts = {
            defaults = {
                -- ...
                sorting_strategy = "ascending",
                layout_config = {
                    prompt_position = "top",
                }
            },
            pickers = {
                find_files = {
                    -- theme = "dropdown",
                }
            },
            extensions = {
                -- ...
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown {
                        -- even more opts
                    }
                }
            }
        },
        keys = {
            { "<leader>ff",       "<cmd>Telescope find_files<cr>" },
            { "<leader><leader>", "<cmd>Telescope find_files<cr>" },
            { "<leader>f/",       "<cmd>Telescope live_grep<cr>" },
            { "<leader>fb",       "<cmd>Telescope buffers<cr>" },
            { "<leader>fh",       "<cmd>Telescope help_tags<cr>" },
            { "<leader>fc",       "<cmd>Telescope commands<cr>" },
            { "<leader>fe",       "<cmd>Telescope file_browser<cr>" },
            { "<leader>fg",       "<cmd>Telescope git_files<cr>" },
            { "<leader>fs",       "<cmd>Telescope git_status<cr>" },
        },
        config = function(opts)
            require('telescope').setup(opts)
            require('telescope').load_extension('file_browser')
            require('telescope').load_extension('ui-select')
        end
    }
}
