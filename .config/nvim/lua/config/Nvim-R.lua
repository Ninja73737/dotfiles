local map = vim.api.nvim_set_keymap

vim.g.R_auto_start = 1
vim.g.R_esc_term = 0
vim.g.R_close_term = 1
vim.g.R_args = { "--quiet", "--save" }
vim.g.R_assign = 0
vim.g.R_openpdf = 1
vim.g.R_openhtml = 0
vim.g.R_user_maps_only = 1

map("n", "<LocalLeader>kp", "<Plug>RMakePDFK", {})
map("n", "<LocalLeader>kh", "<Plug>RMakeHTML", {})
map("n", "<LocalLeader>h", "<Plug>RSendChunkFH", {})
map("n", "<LocalLeader>c", "<Plug>RESendChunk", {})
map("n", "<LocalLeader>o", "<Plug>ROpenLists", {})
map("n", "<LocalLeader>n", "<Plug>RNextRChunk", {})
map("n", "<LocalLeader>N", "<Plug>RPreviousRChunk", {})
map("n", "<LocalLeader>l", "<Plug>RSendLine", {})
