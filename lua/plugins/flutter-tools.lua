return {
    {
        'akinsho/flutter-tools.nvim',
        lazy = true,
        ft = 'dart',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
            'nvim-telescope/telescope.nvim',
            'mfussenegger/nvim-dap',
        },
        event = 'BufEnter *.dart',
        config = function()
            require("flutter-tools").setup {
                decorations = {
                    statusline = {
                        device = true,
                        project_config = true,
                        app_version = true,
                    }
                },
                debugger = {            -- integrate with nvim dap + install dart code debugger
                    enabled = true,
                    run_via_dap = true, -- use dap instead of a plenary job to run flutter apps
                    -- if empty dap will not stop on any exceptions, otherwise it will stop on those specified
                    -- see |:help dap.set_exception_breakpoints()| for more info
                    exception_breakpoints = {},
                    register_configurations = function(paths)
                        require("dap").configurations.dart = {
                        }
                        require("dap.ext.vscode").load_launchjs()
                    end,
                },
                widget_guides = {
                    enabled = true
                },
                dev_log = {
                    enabled = false,
                    -- Open as split horizontal
                    open_cmd = "split"
                },
            }
            require("telescope").load_extension("flutter")
            vim.cmd [[
                nnoremap K <Cmd>lua vim.lsp.buf.hover()<CR>
                 " Jump to definition
                nnoremap gd <Cmd>lua vim.lsp.buf.definition()<CR>
                 " Open code actions using the default lsp UI, if you want to change this please see the plugins above
                nnoremap <F4> <Cmd>lua vim.lsp.buf.code_action()<CR>
                 " Open code actions for the selected visual range
                xnoremap <F4> <Cmd>lua vim.lsp.buf.range_code_action()<CR>

                 " All other keybiding
                nnoremap <F2> <Cmd>lua vim.lsp.buf.rename()<CR>
                nnoremap gr <Cmd>lua vim.lsp.buf.references()<CR>
                nnoremap ga <Cmd>lua vim.lsp.buf.code_action()<CR>
                nnoremap gs <Cmd>lua vim.lsp.buf.signature_help()<CR>
                nnoremap gD <Cmd>lua vim.lsp.buf.type_definition()<CR>
                nnoremap gI <Cmd>lua vim.lsp.buf.implementation()<CR>
                nnoremap <F3> <Cmd>lua vim.lsp.buf.format()<CR>
                nnoremap ]d <Cmd>lua vim.diagnostic.goto_next()<CR>
                nnoremap [d <Cmd>lua vim.diagnostic.goto_prev()<CR>
                nnoremap gl <Cmd>lua vim.diagnostic.open_float()<CR>
                nnoremap gh <Cmd>lua vim.lsp.buf.signature_help()<CR>
            ]]
        end,
    }
}
