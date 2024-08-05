return {
    { 'kevinhwang91/nvim-bqf' },
    {
        'yorickpeterse/nvim-pqf',
        config = function()
            require('pqf').setup()
        end
    },
    {
        "arsham/listish.nvim",
        dependencies = {
            "arsham/arshlib.nvim",
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        config = true,
    }
}
