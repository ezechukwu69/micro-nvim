return {
    {
        "mfussenegger/nvim-jdtls",
        dependencies = {
            "mfussenegger/nvim-dap",
        }
    }
    -- {
    --     'ezechukwu69/nvim-java',
    --     dependencies = {
    --         'nvim-java/lua-async-await',
    --         'nvim-java/nvim-java-refactor',
    --         'nvim-java/nvim-java-core',
    --         'nvim-java/nvim-java-test',
    --         'nvim-java/nvim-java-dap',
    --         'MunifTanjim/nui.nvim',
    --         'neovim/nvim-lspconfig',
    --         'mfussenegger/nvim-dap',
    --         {
    --             'williamboman/mason.nvim',
    --             opts = {
    --                 registries = {
    --                     'github:nvim-java/mason-registry',
    --                     'github:mason-org/mason-registry',
    --                 },
    --             },
    --         }
    --     },
    --     config = function()
    --         require('java').setup()
    --     end
    -- }
}