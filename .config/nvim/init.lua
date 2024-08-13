vim.g.mapleader = " "
vim.g.maplocalleader = " "
require("config.lazy-config")
require("lazy").setup({
    spec = {
        { import = "plugins" }
    },
    dev = {
        ---@type string | fun(plugin: LazyPlugin): string directory where you store your local plugin projects
        path = "~/Developement/neovim/plugins",
        ---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
        patterns = {},    -- For example {"folke"}
        fallback = false, -- Fallback to git when local plugin doesn't exist
    },
})
require("config")
