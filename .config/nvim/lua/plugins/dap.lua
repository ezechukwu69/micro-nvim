return {
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
            "folke/neodev.nvim",
            "williamboman/mason.nvim",
            "jay-babu/mason-nvim-dap.nvim",
            "theHamsta/nvim-dap-virtual-text"
        },
        config = function()
            require("dapui").setup()
            require("nvim-dap-virtual-text").setup()
            require("neodev").setup(
                {
                    library = { plugins = { "nvim-dap-ui" }, types = true }
                }
            )
            require("mason-nvim-dap").setup({
                ensure_installed = { "js", "node2" },
                handlers = {
                    function(config)
                        require("mason-nvim-dap").default_setup(config)
                    end
                }
            })
            local set_map = vim.api.nvim_set_keymap
            set_map("n", "<leader>du", ":lua require'dapui'.toggle()<CR>",
                { noremap = true, silent = true, desc = "Toggle UI" })
            set_map("n", "<leader>de", ":lua require('dapui').eval()<CR>",
                { noremap = true, silent = true, desc = "Eval" })
            set_map("n", "<leader>dq", ":lua require'dap'.close()<CR>", { noremap = true, silent = true, desc = "Kill" })
            set_map("n", "<leader>dcc", ":lua require('dap').continue()<CR>",
                { noremap = true, silent = true, desc = "Continue" })
            set_map("n", "<leader>do", ":lua require'dap'.step_over()<CR>",
                { noremap = true, silent = true, desc = "Step over" })
            set_map("n", "<leader>di", ":lua require'dap'.step_into()<CR>",
                { noremap = true, silent = true, desc = "Step into" })
            set_map("n", "<leader>dO", ":lua require'dap'.step_out()<CR>",
                { noremap = true, silent = true, desc = "Step out" })
            set_map("n", "<leader>dt", ":lua require'dap'.toggle_breakpoint()<CR>",
                { noremap = true, silent = true, desc = "Toggle breakpoint" })
            set_map("n", "<leader>df", ":lua require'dapui'.float_element()<CR>",
                { noremap = true, silent = true, desc = "Float element" })
            set_map("n", "<leader>dcb", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
                { noremap = true, silent = true, desc = "Set breakpoint condition" })
            set_map("n", "<leader>dlb",
                ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
                { noremap = true, silent = true, desc = "Set log point message" })

            local dap, dapui = require("dap"), require("dapui")
            require('dap.ext.vscode').load_launchjs(nil, { node2 = { 'javascript', 'typescript', "www" } })
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end
    }
}
