vim.g.mapleader = " "
vim.g.maplocalleader = " "
require("config.lazy-config")
require("lazy").setup({
  spec = {
    { import = "plugins"}
  }
})
require("config")
