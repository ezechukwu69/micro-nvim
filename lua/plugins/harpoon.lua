return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")
            harpoon:setup({
                settings = {
                    save_on_toggle = true,
                    sync_on_ui_close = true,
                }
            })
            vim.keymap.set("n", "<leader>hm", function() harpoon:list():add() end, { desc = "Add file to harpoon" })
            vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "Previous file in harpoon" })
            vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "Next file in harpoon" })
            vim.keymap.set("n", "<leader>hp>", function() harpoon:list():prev() end, { desc = "Previous file in harpoon" })
            vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end, { desc = "Next file in harpoon" })
            local conf = require("telescope.config").values
            local function toggle_telescope(harpoon_files)
                local file_paths = {}
                for _, item in ipairs(harpoon_files.items) do
                    table.insert(file_paths, item.value)
                end

                require("telescope.pickers").new({}, {
                    prompt_title = "Harpoon",
                    finder = require("telescope.finders").new_table({
                        results = file_paths,
                    }),
                    previewer = conf.file_previewer({}),
                    sorter = conf.generic_sorter({}),
                }):find()
            end

            vim.keymap.set("n", "<leader>fm", function() toggle_telescope(harpoon:list()) end,
                { desc = "Toggle harpoon window" })
            vim.keymap.set("n", "<leader>ho", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
                { desc = "Open harpoon window" })
        end
    }
}
