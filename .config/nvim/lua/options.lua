local cmd = vim.cmd

vim.g.cursorhold_updatetime = 250
vim.o.foldmethod = "marker"
cmd([[set shortmess += "c"]])
vim.o.pumblend = 20
vim.o.guifont = "JetBrainsMono Nerd Font:h14"
vim.o.pumheight = 15
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = "a"
vim.o.scrolloff = 7
vim.o.list = true
vim.o.listchars = "tab:›\\ ,trail:•,extends:#,nbsp:."
vim.o.timeout = false
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.autoindent = true
cmd([[
syntax on
filetype plugin indent on
]])
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.showmode = false
vim.o.fillchars = "fold: ,vert:│,eob: ,msgsep:‾"
vim.o.compatible = false
vim.o.termguicolors = true
