vim.g.bullets_set_mappings = 0
vim.g.bullets_outline_levels = { "ABC", "num", "std-" }
vim.g.bullets_checkbox_markers = " ox"
vim.g.bullets_renumber_on_change = 0
vim.g.bullets_enabled_file_types = { "markdown", "rmd", "tex" }

vim.cmd(
    "autocmd FileType "
        .. vim.fn.join(vim.g.bullets_enabled_file_types, ",")
        .. " nmap <LocalLeader><Space> <CMD>ToggleCheckbox<CR>"
)
vim.cmd(
    "autocmd FileType " .. vim.fn.join(vim.g.bullets_enabled_file_types, ",") .. " noremap o <CMD>InsertNewBullet<CR>"
)
vim.cmd(
    "autocmd FileType "
        .. vim.fn.join(vim.g.bullets_enabled_file_types, ",")
        .. " inoremap <CR> <CMD>InsertNewBullet<CR>"
)
