local map = vim.api.nvim_set_keymap

vim.o.colorcolumn = "80"

map("n", "<LocalLeader><CR>", "<CMD>!python3 %<CR>", {})
