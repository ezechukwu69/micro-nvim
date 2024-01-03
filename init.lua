vim.g.mapleader = " "
require("config.lazy-config")
require("lazy").setup({
  spec = {
    { import = "plugins"}
  }
})
require("config")
