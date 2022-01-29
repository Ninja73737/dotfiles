if vim.fn.has("persistent_undo") == 1 then
    vim.o.undodir = vim.fn.stdpath("data") .. "/undodir"

    if not vim.fn.isdirectory(vim.o.undodir) then
        vim.fn.mkdir(vim.o.undodir, "p", 0700)
    end

    vim.o.undofile = true
end
vim.api.nvim_set_keymap("n", "U", "<CMD>UndotreeToggle<CR>", {})
