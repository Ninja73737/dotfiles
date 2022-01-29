local null_ls = require("null-ls")
local builtins = null_ls.builtins
local diagnostics = builtins.diagnostics
local formatting = builtins.formatting

local git_ancestor = require("lspconfig.util").find_git_ancestor(vim.fn.expand("%:p"))
-- TODO: fix config file extension overrides not showing up
local cspell_args = { "--locale", "en-GB" }
if git_ancestor ~= nil then
    local potential_names = { ".cspell.json", ".cspell.yml", ".cspell.yaml" }
    for _, name in ipairs(potential_names) do
        local target = git_ancestor .. "/" .. name
        if vim.fn.filereadable(target) == 1 then
            cspell_args = { "--config", target }
            break
        end
    end
end

local markdownlint_extra_args = {}
local home = os.getenv("HOME")
if home ~= nil then
    markdownlint_extra_args = { "-c", home .. "/.config/nvim/markdownlint.yaml", "--stdin" }
end

null_ls.setup({
    sources = {
        diagnostics.cspell.with({
            filetypes = { "markdown", "rmd" },
            extra_args = cspell_args,
        }),
        diagnostics.hadolint,
        diagnostics.markdownlint.with({
            filetypes = { "markdown" },
            extra_args = markdownlint_extra_args,
        }),
        diagnostics.shellcheck,

        formatting.autopep8,
        formatting.fish_indent,
        formatting.google_java_format.with({ extra_args = { "--aosp" } }),
        formatting.markdownlint.with({ filetypes = { "markdown" } }),
        formatting.prettierd.with({
            filetypes = {
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
                "vue",
                "css",
                "scss",
                "less",
                "html",
                "json",
                "yaml",
                "markdown",
                "graphql",
                "svelte",
            },
        }),
        formatting.stylua.with({
            extra_args = function(params)
                return {
                    "--indent-type",
                    "spaces",
                    "--indent-width",
                    vim.api.nvim_buf_get_option(params.bufnr, "shiftwidth"),
                }
            end,
        }),
    },
    on_attach = vim.lsp._on_attach,
    capabilities = vim.lsp._capabilities,
})
