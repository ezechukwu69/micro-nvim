return {
    {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function ()
        require('telescope').setup{
          defaults = {
            -- ...
          },
          pickers = {
            find_files = {
              theme = "dropdown",
            }
          },
          extensions = {
            -- ...
          }
        }
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>f/', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      end
    }
}
