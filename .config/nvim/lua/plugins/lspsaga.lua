return {
    {
        'nvimdev/lspsaga.nvim',
        config = function()
            require('lspsaga').setup({
                definition = {
                    keys = {
                        edit = "<C-o>",
                        vsplit = "<C-v>",
                        split = "<C-s>",
                        tabe = "<C-t>",
                        quit = "q",
                        close = "<C-c>"
                    }
                },
                outline = {
                    close_after_jump = true,
                    keys = {
                        jump = "<CR>",
                        toggle_or_jump = "o",
                        quit = "q"
                    }
                }
            })
        end,
        event = "LspAttach",
        dependencies = {
            'nvim-treesitter/nvim-treesitter', -- optional
            'nvim-tree/nvim-web-devicons', -- optional
        }
    }
}
