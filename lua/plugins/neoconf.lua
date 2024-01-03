return {
	{
    "folke/neoconf.nvim",
    dependencies = {
        {"neovim/nvim-lspconfig"}
    },
    lazy = false,
    cmd = "Neoconf",
    config = function()
	 require("neoconf").setup({})
	end,
    }
}
