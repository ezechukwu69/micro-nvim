return {
	{
    "folke/neoconf.nvim",
    dependencies = {
        {"neovim/nvim-lspconfig"}
    },
    lazy = false,
    cmd = "Neoconf",
    priority = 10000,
    config = function()
	 require("neoconf").setup({})
	end,
    }
}
