local api = vim.api
local cmd = vim.cmd
local map = api.nvim_set_keymap

map("n", "<SPACE>", "<NOP>", { noremap = true })
map("n", "<BS>", "<NOP>", { noremap = true })
if vim.fn.has("win32") then
    map("n", "K", "<NOP>", { noremap = true })
end
cmd([[let mapleader = "\<BS>"]])
vim.g.maplocalleader = " "

map("n", "Q", "<CMD>quitall!<CR>", {})
map("n", "W", "<CMD>write|normal zz<CR>", {})
map("n", "Z", "<CMD>wq<CR>", {})

map("n", "$", "g_", {})
map("v", "$", "g_", {})

map("n", "<Leader>h", "<CMD>noh<CR>", {})

map("n", "<Leader>qo", "<CMD>copen<CR>", {})
map("n", "<Leader>qc", "<CMD>cclose<CR>", {})

map("n", "n", "nzzzv", { noremap = true })
map("n", "N", "Nzzzv", { noremap = true })

map("i", ",", ",<C-g>u", { noremap = true })
map("i", ".", ".<C-g>u", { noremap = true })
map("i", "!", "!<C-g>u", { noremap = true })
map("i", "?", "?<C-g>u", { noremap = true })
map("i", "<CR>", "<CR><C-g>u", { noremap = true })

map("v", "J", "<CMD>m '>+1<CR>gv=gv", {})
map("v", "K", "<CMD>m '>-2<CR>gv=gv", {})

map("n", "p", '"+p', { noremap = true })
map("n", "P", '"+P', { noremap = true })
map("v", "p", '"+p', { noremap = true })
map("v", "P", '"+P', { noremap = true })

map("n", "y", '"+y', { noremap = true })
map("v", "y", '"+y', { noremap = true })
map("n", "Y", "vg_O", { noremap = true })

map("n", "d", '"+d', { noremap = true })
map("n", "D", '"+D', { noremap = true })
map("v", "d", '"+d', { noremap = true })
map("v", "D", '"+D', { noremap = true })

map("i", "<F1>", "<NUL>", {})
map("i", "<F2>", "<NUL>", {})
map("i", "<F3>", "<NUL>", {})
map("i", "<F4>", "<NUL>", {})
map("i", "<F5>", "<NUL>", {})
map("i", "<F6>", "<NUL>", {})
map("i", "<F7>", "<NUL>", {})
map("i", "<F8>", "<NUL>", {})
map("i", "<F9>", "<NUL>", {})
map("i", "<F10>", "<NUL>", {})
map("i", "<F11>", "<NUL>", {})
map("i", "<F12>", "<NUL>", {})

map("o", "i*", "<CMD><C-U>normal! T*vt*<CR>", { silent = true })
map("v", "i*", "<CMD><C-U>normal! T*vt*<CR>", { silent = true })
map("o", "a*", "<CMD><C-U>normal! F*vf*<CR>", { silent = true })
map("v", "a*", "<CMD><C-U>normal! F*vf*<CR>", { silent = true })
map("o", "i$", "<CMD><C-U>normal! T$vt$<CR>", { silent = true })
map("v", "i$", "<CMD><C-U>normal! T$vt$<CR>", { silent = true })
map("o", "a$", "<CMD><C-U>normal! F$vf$<CR>", { silent = true })
map("v", "a$", "<CMD><C-U>normal! F$vf$<CR>", { silent = true })

map("i", "<C-h>", "<ESC>vlbs", {})
map("i", "<C-BS>", "<ESC>vlbs", {})
map("i", "<C-z>", "<C-o>u", { noremap = true })

map("n", "<Tab>", ">>", {})
map("n", "<S-Tab>", "<<", {})

map("v", "<Tab>", ">gv", {})
map("v", "<S-Tab>", "<gv", {})

map("t", "<C-w>", "<C-\\><C-n><C-w>", {})
