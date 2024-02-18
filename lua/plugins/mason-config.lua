return {
    { "williamboman/mason.nvim", 
    dependencies = {
        {"williamboman/mason-lspconfig.nvim"},
        {"neovim/nvim-lspconfig"},
        {"VonHeikemen/lsp-zero.nvim"},
        {"folke/neodev.nvim"},
    },
    config =  function()
        local lsp_zero = require("lsp-zero")
        lsp_zero.on_attach(function(client, bufnr)
          -- see :help lsp-zero-keybindings
          -- to learn the available actions
          lsp_zero.default_keymaps({buffer = bufnr})
        end)
        require("mason").setup()
        require("mason-lspconfig").setup({
          ensure_installed = { "emmet_ls" },
          handlers = {
           lsp_zero.default_setup
          }
        })
        -- add heex files to emmet_ls
        local lspconfig = require("lspconfig")
        lspconfig.emmet_ls.setup({
          filetypes = { "heex", 'ex', "html", "jsx", "tsx" },
        })
        lspconfig.zls.setup({})
       end
    },
}
