return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-cmdline" },
            { "hrsh7th/nvim-cmp" },
            { "L3MON4D3/LuaSnip" },
            { "saadparwaiz1/cmp_luasnip" }
        },
        priority = 7000,
        config = function()
            local cmp = require 'cmp'
            local defaults = require("cmp.config.default")()
            vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

            local auto_select = true
            require("lsp-zero").extend_lspconfig()
            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                    end,
                },
                auto_brackets = {}, -- configure any filetype to auto add brackets
                completion = {
                    completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
                },
                preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ['<Up>'] = cmp.mapping({
                        i = function()
                            if cmp.visible() then
                                cmp.select_prev_item()
                            end
                        end
                    }),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                    ["<Tab>"] = cmp.mapping({
                        i = function(_, _)
                            if cmp.visible() then
                                cmp.select_next_item({ behavior = cmp.SelectBehavior.Replace })
                            else
                                -- fallback to default behaviour by inserting a tab character
                                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n",
                                    true)
                            end
                        end
                    }),
                }),
                experimental = {
                    ghost_text = {
                        hl_group = "CmpGhostText",
                    },
                },
                sorting = defaults.sorting,
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    -- { name = 'vsnip' }, -- For vsnip users.
                    { name = 'luasnip' }, -- For luasnip users.
                    -- { name = 'ultisnips' }, -- For ultisnips users.
                    -- { name = 'snippy' }, -- For snippy users.
                }, {
                    { name = 'buffer' },
                })
            })
            cmp.setup.filetype('gitcommit', {
                sources = cmp.config.sources({
                    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
                }, {
                    { name = 'buffer' },
                })
            })

            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                })
            })
            local lspconfig = require('lspconfig')
            -- lspconfig.elixirls.setup {
            --     cmd = { "elixir-ls" },
            -- }
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local lsp_zero = require("lsp-zero")
            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({ buffer = bufnr })
                if client.server_capabilities.documentSymbolProvider then
                    navic.attach(client, bufnr)
                end
                if client.server_capabilities.inlayHintProvider then
                    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                end
                local opts = { buffer = bufnr }
                vim.keymap.set('n', '<leader>cr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                -- vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
                -- vim.keymap.set('x', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
                vim.keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<cr>', opts)
                vim.keymap.set('x', '<leader>ca', '<cmd>Lspsaga code_action<cr>', opts)
                vim.keymap.set('n', '<leader>co', '<cmd>Lspsaga outline<cr>', opts)
                vim.keymap.set('n', '<leader>ck', '<cmd>Lspsaga peek_definition<cr>', opts)
                vim.keymap.set('n', '<leader>cf', '<cmd>lua vim.lsp.buf.format()<cr>', opts)
                vim.keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
                vim.keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
                vim.keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
                vim.keymap.set("n", "<leader>gs", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", opts)
                vim.keymap.set("n", "<leader>gw", "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>", opts)
                vim.keymap.set("n", "<leader>gh", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
                vim.keymap.set("n", "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
                vim.keymap.set("n", "<leader>ge", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
                vim.keymap.set("n", "<leader>gp", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
                vim.keymap.set("n", "<leader>gn", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
                vim.keymap.set('n', '<leader>gf', '<cmd>Lspsaga finder<cr>', opts)
                vim.keymap.set('n', "<leader>gt", "<cmd>Lspsaga term_toggle<cr>", opts)
                vim.keymap.set("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<cr>", opts)
            end)
        end
    }
}
