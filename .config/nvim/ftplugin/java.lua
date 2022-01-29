local map = vim.api.nvim_set_keymap

vim.o.shiftwidth = 4
vim.o.softtabstop = 4

map("n", "<LocalLeader><CR>", "<CMD>!java %<CR>", {})
