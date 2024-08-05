return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },
    { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
    {
        "rebelot/kanagawa.nvim",
        config = function()
            require("kanagawa").setup({
                theme = "dragon", -- Load "wave" theme when 'background' option is not set
                background = { -- map the value of 'background' option to a theme
                    dark = "dragon", -- try "dragon" !
                    light = "lotus"
                },
            })
        end,
    }
}
