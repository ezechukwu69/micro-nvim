return {
    "vuki656/package-info.nvim",
    dependencies = {
        "elianiva/telescope-npm.nvim",
    },
    config = function()
        require("package-info").setup()
        require("telescope").setup({
            extensions = {
                package_info = {
                    -- Optional theme (the extension doesn't set a default theme)
                    theme = "ivy",
                },
            },
        })

        require("telescope").load_extension("package_info")
        -- Show dependency versions
        require("which-key").register({
            ["<LEADER>n"] = { name = "N (node,etc.)" },
        })

        vim.keymap.set({ "n" }, "<LEADER>nns", require("package-info").show,
            { silent = true, noremap = true, desc = "Show dependency versions" })

        -- Hide dependency versions
        vim.keymap.set({ "n" }, "<LEADER>nnc", require("package-info").hide,
            { silent = true, noremap = true, desc = "Hide dependency versions" })

        -- Toggle dependency versions
        vim.keymap.set({ "n" }, "<LEADER>nnt", require("package-info").toggle,
            { silent = true, noremap = true, desc = "Toggle dependency versions" })

        -- Update dependency on the line
        vim.keymap.set({ "n" }, "<LEADER>nnu", require("package-info").update,
            { silent = true, noremap = true, desc = "Update dependency on the line" })

        -- Delete dependency on the line
        vim.keymap.set({ "n" }, "<LEADER>nnd", require("package-info").delete,
            { silent = true, noremap = true, desc = "Delete dependency on the line" })

        -- Install a new dependency
        vim.keymap.set({ "n" }, "<LEADER>nni", require("package-info").install,
            { silent = true, noremap = true, desc = "Install a new dependency" })

        -- Install a different dependency version
        vim.keymap.set({ "n" }, "<LEADER>nnp", require("package-info").change_version,
            { silent = true, noremap = true, desc = "Install a different dependency version" })

        vim.keymap.set({ "n" }, "<LEADER>nnr", "<cmd>Telescope npm scripts<cr>",
            { silent = true, noremap = true, desc = "Search npm scripts" })
    end
}
