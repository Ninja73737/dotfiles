require("hop").setup()
vim.api.nvim_set_keymap("n", "f", "<CMD>lua require'hop'.hint_words()<CR>", {})
vim.api.nvim_set_keymap("v", "f", "<CMD>lua require'hop'.hint_words()<CR>", {})
