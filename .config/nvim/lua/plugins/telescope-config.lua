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
        },
        config = function(opts)
            require('telescope').setup(opts)
            require('telescope').load_extension('file_browser')
            require('telescope').load_extension('ui-select')
        end
    }
}
