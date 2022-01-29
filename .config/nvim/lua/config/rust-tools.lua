require("rust-tools").setup({
    tools = {
        hover_actions = { border = "none" },
        runnables = { use_telescope = true },
        debuggables = { use_telescope = true },
    },
    server = {
        on_attach = vim.lsp._on_attach,
        flags = { debounce_text_changes = 150, capabilities = vim.lsp._capabilities },
    },
})
