require("clipboard-image").setup({
    default = {
        img_dir = "%:p:r",
        img_dir_txt = "%:r",
        img_name = function()
            return os.date("%Y-%m-%d-%H-%M-%S")
        end,
    },
    rmd = {
        affix = "![](<%s>)",
    },
    markdown = {
        affix = "![](<%s>)",
    },
})
vim.api.nvim_set_keymap("n", "<LocalLeader>i", "<CMD>PasteImg<CR>", {})
