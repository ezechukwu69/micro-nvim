return {
    {
        'simrat39/symbols-outline.nvim',
        config = function()
            require("symbols-outline").setup({
                keymaps = { -- These keymaps can be a string or a table for multiple keys
                    close = { "<Esc>", "q" },
                    goto_location = "<Cr>",
                    focus_location = "o",
                    hover_symbol = "<C-space>",
                    toggle_preview = "K",
                    rename_symbol = "r",
                    code_actions = "a",
                    fold = "h",
                    unfold = "l",
                    fold_all = "W",
                    unfold_all = "E",
                    fold_reset = "R",
                    show_help = "?",
                },
            })
            vim.keymap.set("n", "<leader>o", "<cmd>SymbolsOutline<CR>", {
                desc = "Toggle symbols outline"
            })
        end
    }
}
