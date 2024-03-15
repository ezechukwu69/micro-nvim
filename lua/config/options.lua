vim.wo.number = true
-- vim.cmd.colorscheme "catppuccin-mocha"
vim.cmd('colorscheme ayu-dark')
vim.cmd('set tabstop=4')
vim.cmd('set shiftwidth=4')
vim.cmd('set expandtab')
vim.cmd('set relativenumber')
vim.cmd('set numberwidth=2')
--Lua:
vim.g.material_style = "deep ocean"
vim.opt.termguicolors = true

vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<leader>d", "<C-d>", {
    desc = "Scroll down"
})
vim.keymap.set("n", "<leader>u", "<C-u>", {
    desc = "Scroll up"
})
