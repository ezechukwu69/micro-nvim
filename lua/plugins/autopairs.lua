return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        lazy = true,
        dependencies = {
            {"hrsh7th/nvim-cmp"}
        },
        opts = {},
        config = function ()
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            local cmp = require('cmp')
            cmp.event:on(
              'confirm_done',
              cmp_autopairs.on_confirm_done()
            )
            require('nvim-autopairs').setup({
              enable_check_bracket_line = false
            })
        end
    }
}
