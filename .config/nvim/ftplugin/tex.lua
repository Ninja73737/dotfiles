local map = vim.api.nvim_set_keymap

require("output_format/pdf")

map("n", "<LocalLeader><CR>", "<CMD>noa w <BAR> TexlabBuild<CR>", {})
map("n", "<LocalLeader>f", "<CMD>TexlabForward<CR>", {})
