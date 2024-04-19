vim.wo.number = true
-- vim.cmd.colorscheme "catppuccin-mocha"
vim.cmd('colorscheme ayu-dark')
vim.cmd('set tabstop=4')
vim.cmd('set shiftwidth=4')
vim.cmd('set expandtab')
vim.cmd('set relativenumber')
vim.cmd('set numberwidth=2')
vim.cmd(":hi NonText guifg=bg")
--Lua:
vim.g.material_style = "deep ocean"
vim.opt.termguicolors = true
vim.opt.signcolumn = 'yes'
vim.opt.inccommand = "split"
vim.opt.wrap = true

vim.opt.list = true
vim.opt.listchars = { tab = "▸ ", trail = "·", nbsp = "␣" }
vim.opt.cursorline = true
vim.opt.hlsearch = true


vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "no highlight" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "yank to clipboard" })
vim.keymap.set("n", "]j", "<cmd>cnext<CR>", { desc = "next quickfix" })
vim.keymap.set("n", "[j", "<cmd>cprev<CR>", { desc = "prev quickfix" })
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>", { desc = "next quickfix" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>", { desc = "prev quickfix" })

vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<leader>dd", "<C-d>", {
    desc = "Scroll down"
})
vim.keymap.set("n", "<leader>u", "<C-u>", {
    desc = "Scroll up"
})
