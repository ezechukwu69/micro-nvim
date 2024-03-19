return {
    {
        'kristijanhusak/vim-dadbod-ui',
        dependencies = {
            { 'tpope/vim-dadbod',                     lazy = true },
            { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
        },
        cmd = {
            'DBUI',
            'DBUIToggle',
            'DBUIAddConnection',
            'DBUIFindBuffer',
        },
        keys = {
            { '<leader>dbo', '<cmd>DBUI<cr>', desc = 'DBUI' },
            { '<leader>dbt', '<cmd>DBUIToggle<cr>', desc = 'DBUI Toggle' },
            { '<leader>dba', '<cmd>DBUIAddConnection<cr>', desc = 'DBUI Add Connection' },
            { '<leader>dbf', '<cmd>DBUIFindBuffer<cr>', desc = 'DBUI Find Buffer' },
        },
        init = function()
            -- Your DBUI configuration
            vim.g.db_ui_use_nerd_fonts = 1
        end,
    },
}
