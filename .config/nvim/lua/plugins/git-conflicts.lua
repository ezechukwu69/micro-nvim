return {
    {
        'akinsho/git-conflict.nvim',
        version = "*",
        config = function()
            require('git-conflict').setup({
                default_mappings = false
            })
            vim.keymap.set('n', '<leader>cco', '<Plug>(git-conflict-ours)')
            vim.keymap.set('n', '<leader>ccq', '<cmd>GitConflictListQf<cr>')
            vim.keymap.set('n', '<leader>cct', '<Plug>(git-conflict-theirs)')
            vim.keymap.set('n', '<leader>ccb', '<Plug>(git-conflict-both)')
            vim.keymap.set('n', '<leader>cc0', '<Plug>(git-conflict-none)')
            vim.keymap.set('n', '<leader>[x', '<Plug>(git-conflict-prev-conflict)')
            vim.keymap.set('n', '<leader>]x', '<Plug>(git-conflict-next-conflict)')
        end
    }
}
