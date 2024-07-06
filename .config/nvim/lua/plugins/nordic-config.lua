return {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 11000,
    config = function()
        require('nordic').load()
    end,
}
