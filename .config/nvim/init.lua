require("plugins")
require("mappings")
require("options")
require("autocmd")
require("commands")

local cmd = vim.cmd

-- TODO: write plugin that checks if a git repo is yours or a fork, and runs range formatting on only lines that have changed in git automatically
-- TODO: https://github.com/mfussenegger/nvim-dap
-- TODO: https://github.com/seblj/nvim-tabline
-- TODO: fix telescope live grep colon filetypes
-- TODO: add noa writes to compile and execute commands
-- TODO: add gh issues source for completion: https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/after/plugin/cmp_gh_source.lua
-- TODO: go through rockerBOO/awesome-neovim, particularly the markdown section

vim.lsp._on_attach = function(_, bufnr)
    local function buf_map(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local opts = { noremap = false, silent = true }

    buf_map("n", "gd", "<CMD>split | Telescope lsp_definitions<CR>", opts)
    buf_map("n", "gt", "<CMD>split | Telescope lsp_type_definitions<CR>", opts)
    buf_map("n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_map("n", "gi", "<CMD>Telescope lsp_implementations<CR>", opts)
    buf_map("n", "gr", "<CMD>Telescope lsp_references<CR>", opts)
    buf_map("n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>", opts)
    buf_map("n", "<Leader>r", "<CMD>lua vim.lsp.buf.rename()<CR>", opts)
    buf_map("n", "<Leader>f", "<CMD>lua vim.lsp.buf.formatting()<CR>", opts)
    buf_map("n", "<Leader>F", "<CMD>Telescope lsp_code_actions<CR>", opts)
    buf_map("v", "<Leader>F", "<CMD>Telescope lsp_range_code_actions<CR>", opts)
    buf_map("n", "<Leader>N", "<CMD>lua vim.diagnostic.goto_prev()<CR>", opts)
    buf_map("n", "<Leader>n", "<CMD>lua vim.diagnostic.goto_next()<CR>", opts)

    vim.opt.signcolumn = "yes"

    -- TODO: check if we're in a repository owned by someone else or a fork of a
    -- repository owned by someone else, and if we are, don't register this
    -- autocommand.
    vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)]])
end

vim.lsp._on_attach_no_fomatting = function(client, bufnr)
    vim.lsp._on_attach(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
end

local ok, res = pcall(require, "cmp_nvim_lsp")
if ok then
    vim.lsp._capabilities = res.update_capabilities(vim.lsp.protocol.make_client_capabilities())
end
