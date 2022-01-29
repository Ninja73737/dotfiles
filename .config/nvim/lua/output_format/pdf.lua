local map = vim.api.nvim_set_keymap

map("n", "<LocalLeader>z", [[<CMD>call system('zth "' . expand('%:p:r') . '.pdf"')<CR>]], {})
