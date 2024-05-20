return {
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
        opts = {
            rocks = { "lua-curl", "nvim-nio", "mimetypes" }
        }
    },
    {
        "rest-nvim/rest.nvim",
        ft = "http",
        dependencies = { "luarocks.nvim" },
        config = function()
            require("rest-nvim").setup({
                {
                    "<localleader>xr", "<cmd>Rest run<cr>", "Run request under the cursor",
                },
                {
                    "<localleader>xl", "<cmd>Rest run last<cr>", "Re-run latest request",
                },
            })

            vim.keymap.set("n", "<localleader>xr", "<cmd>Rest run<cr>",
                { desc = "Run request under the cursor" })
            vim.keymap.set("n", "<localleader>xl", "<cmd>Rest run last<cr>",
                { desc = "Re-run latest request" })

            -- first load extension
            require("telescope").load_extension("rest")
        end,
    }
}
