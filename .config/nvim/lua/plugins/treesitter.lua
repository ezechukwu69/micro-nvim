return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            'nvim-treesitter/nvim-treesitter-context'
        },
        -- tag = 'v0.9.2',
        config = function()
            require 'nvim-treesitter.configs'.setup {
                -- A list of parser names, or "all" (the five listed parsers should always be installed)
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "lua", "xml", "http", "json", "graphql" },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,

                ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
                -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
                --
                textobjects = {
                    lsp_interop = {
                        enable = true,
                        border = 'none',
                        floating_preview_opts = {},
                        peek_definition_code = {
                            ["<leader>pf"] = { query = "@function.outer", desc = "Peek function" },
                            ["<leader>pc"] = { query = "@class.outer", desc = "Peek class" },
                        },
                    },
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = { query = "@function.outer", desc = "Around function" },
                            ["if"] = { query = "@function.inner", desc = "Inside function" },
                            ["ac"] = { query = "@class.outer", desc = "Around class" },
                            ["ic"] = { query = "@class.inner", desc = "Inside class" },
                            ["al"] = { query = "@loop.outer", desc = "Around loop" },
                            ["il"] = { query = "@loop.inner", desc = "Inside loop" },
                            ["ad"] = { query = "@statement.outer", desc = "Around statement" },
                            ["aaa"] = { query = "@parameter.outer", desc = "Around assignment" },
                            ["aai"] = { query = "@parameter.inner", desc = "Inside assignment" },
                            ["aal"] = { query = "@parameter.lhs", desc = "Around assignment left" },
                            ["aar"] = { query = "@parameter.rhs", desc = "Around assignment right" },
                            ["a/"] = { query = "@comment.outer", desc = "Around commit" },
                            ["i/"] = { query = "@comment.inner", desc = "Inside commit" },
                        },
                        include_surrounding_whitespace = true,
                    },
                    swap = {
                        enable = true,
                        swap_next = {
                            ["<leader>ma"] = { query = "@parameter.inner", desc = "Move parameter forward" },
                            ["<leader>mf"] = { query = "@function.outer", desc = "Move function forward" },
                            ["<leader>mc"] = { query = "@class.outer", desc = "Move class forward" },
                        },
                        swap_previous = {
                            ["<leader>mA"] = { query = "@parameter.inner", desc = "Move parameter backward" },
                            ["<leader>mF"] = { query = "@function.outer", desc = "Move function backward" },
                            ["<leader>mC"] = { query = "@class.outer", desc = "Move class backward" },
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true, -- whether to set jumps in the jumplist
                        goto_next_start = {
                            ["]m"] = { query = "@function.outer", desc = "Next function start" },
                            ["]]"] = { query = "@class.outer", desc = "Next class start" },
                            ["]o"] = { query = "@loop.*", desc = "Next loop start" },
                            ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
                            ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
                        },
                        goto_next_end = {
                            ["]M"] = { query = "@function.outer", desc = "Next function end" },
                            ["]["] = { query = "@class.outer", desc = "Next class end" },
                        },
                        goto_previous_start = {
                            ["[m"] = { query = "@function.outer", desc = "Previous function start" },
                            ["[["] = { query = "@class.outer", desc = "Previous class start" },
                        },
                        goto_previous_end = {
                            ["[M"] = { query = "@function.outer", desc = "Previous function end" },
                            ["[]"] = { query = "@class.outer", desc = "Previous class end" },
                        },
                        goto_next = {
                            ["]d"] = { query = "@conditional.outer", desc = "Next conditional" },
                        },
                        goto_previous = {
                            ["[d"] = { query = "@conditional.outer", desc = "Previous conditional" },
                        }
                    },
                },
                highlight = {
                    enable = true,
                },
            }

            local tsc = require("treesitter-context")
            tsc.setup {
                enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
                max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
                mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
            }
        end
    }
}
