return {
    {
        "Mofiqul/dracula.nvim"
    },
    {
        "ful1e5/onedark.nvim",
        config = function()
            -- Lua
            require('onedark').setup()
        end
    },
    {
        "Shatur/neovim-ayu",
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.cmd("colorscheme ayu")
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        "RRethy/base16-nvim",
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.cmd("colorscheme base16-gruvbox-dark-medium")
        end,
    }
}
