local map = vim.api.nvim_set_keymap

vim.g.R_auto_start = 1
vim.g.R_esc_term = 0
vim.g.R_close_term = 1
vim.g.R_args = { "--quiet", "--save" }
vim.g.R_assign = 0
vim.g.R_openpdf = 1
vim.g.R_openhtml = 0
vim.g.R_user_maps_only = 1

if vim.o.ft == "rmd" then
    map("n", "<LocalLeader>kp", "<Plug>RMakePDFK", {})
    map("n", "<LocalLeader>kh", "<Plug>RMakeHTML", {})
    map("n", "<LocalLeader>v", "<Plug>RSendChunkFH", {})
    map("n", "<LocalLeader>c", "<Plug>RESendChunk", {})
else
    map("n", "<LocalLeader>v", "<Plug>RSendAboveLines", {})
    map("n", "<LocalLeader>c", "<Plug>RESendParagraph", {})
end

map("n", "<LocalLeader>a", "<Plug>RSendFile", {})
map("n", "<LocalLeader>o", "<Plug>ROpenLists", {})
