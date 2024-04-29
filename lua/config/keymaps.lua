
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "no highlight" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "yank to clipboard" })
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>", { desc = "next quickfix" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>", { desc = "prev quickfix" })

vim.keymap.set("n", "<leader>tt", "<cmd>tabnew<CR>", { desc = "New Tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabnext<CR>", { desc = "Next Tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabprev<CR>", { desc = "Prev Tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close Tab" })
vim.keymap.set("n", "<C-l>", "<cmd>tabnext<CR>", { desc = "Next Tab" })
vim.keymap.set("n", "<C-h>", "<cmd>tabprev<CR>", { desc = "Prev Tab" })

vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<leader>dd", "<C-d>", {
    desc = "Scroll down"
})
vim.keymap.set("n", "<leader>u", "<C-u>", {
    desc = "Scroll up"
})
