require("telescope").setup({
    defaults = {
        scroll_strategy = "limit",
        layout_config = {
            horizontal = {
                preview_cutoff = 60,
            },
        },
    },
})

local map = vim.api.nvim_set_keymap
map("n", "tg", "<CMD>Telescope live_grep<CR>", {})
map("n", "tf", "<CMD>Telescope find_files<CR>", {})
map("n", "ty", "<CMD>Telescope filetypes<CR>", {})
map("n", "tb", "<CMD>Telescope git_branches<CR>", {})
map("n", "tc", "<CMD>Telescope git_commits<CR>", {})
map("n", "ts", "<CMD>Telescope lsp_document_symbols<CR>", {})
map("n", "t/", "<CMD>Telescope current_buffer_fuzzy_find<CR>", {})
