require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    ignore_install = (function()
        if not vim.fn.has("win32") == 1 then
            local h = io.popen("uname")
            local res = h:read("*a")
            h:close()
            if res == "Darwin\n" then
                return { "phpdoc", "haskell" }
            end
        end

        return { "phpdoc" }
    end)(),
    -- TODO: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    refactor = {
        -- highlight_definitions = { enable = true },
    },
    tree_docs = {
        enable = true,
        keymaps = {
            doc_all_in_range = "<NOP>",
            doc_node_at_cursor = "td",
            edit_doc_at_cursor = "<NOP>",
        },
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        colors = (function()
            local home = os.getenv("HOME")
            if home ~= nil then
                package.path = home .. "/.cache/wal/?.lua;" .. package.path
                return require("colors").colorful
            else
                return nil
            end
        end)(),
        termcolors = { "1", "2", "3", "4", "5", "6", "7", "1", "2", "3", "4", "5", "6", "7", "1", "2" },
    },
    -- TODO: add contexts for different markdown comments, and maybe contribute them if someone else hasn't already?
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
        config = {
            markdown = {
                __default = "<!-- %s -->",
                -- TODO: make this dynamic based on language of code block
                code_fence_content = "# %s",
                setext_heading = "# %s",
            },
            rmd = {
                __default = "<!-- %s -->",
                -- TODO: make this dynamic based on language of code block
                code_fence_content = "# %s",
                setext_heading = "# %s",
            },
        },
    },
    playground = {
        enable = true,
    },
    pairs = {
        enable = true,
    },
})
