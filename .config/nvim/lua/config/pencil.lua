vim.g["pencil#conceallevel"] = 2
vim.g["pencil#wrapModeDefault"] = "soft"
vim.g["pencil#cursorwrap"] = 0
vim.cmd([[autocmd FileType markdown,rmd,tex call pencil#init()]])
