return {
    {
      'nvimdev/dashboard-nvim',
      event = 'VimEnter',
      priority = 20000,
      config = function()
        require('dashboard').setup {
          -- config
          theme = "hyper"
        }
      end,
      dependencies = { {'nvim-tree/nvim-web-devicons'}}
    }
}
