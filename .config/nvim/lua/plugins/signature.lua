return {
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {
            lsp = {
                signature = {
                    enabled = false
                }
            }
        },
        config = function(_, opts) require 'lsp_signature'.setup(opts) end
    }
}
