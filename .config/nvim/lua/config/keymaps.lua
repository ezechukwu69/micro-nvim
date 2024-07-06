
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "no highlight" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "yank to clipboard" })
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>", { desc = "next quickfix" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>", { desc = "prev quickfix" })

vim.keymap.set("n", "<leader>tt", "<cmd>tabnew<CR>", { desc = "New Tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabnext<CR>", { desc = "Next Tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabprev<CR>", { desc = "Prev Tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close Tab" })
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprev<CR>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<leader>bx", "<cmd>bd<CR>", { desc = "Close Buffer" })
vim.keymap.set("n", "<leader>bX", "<cmd>bufdo bd<CR>", { desc = "Close All Buffer" })
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
