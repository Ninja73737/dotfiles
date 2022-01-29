vim.g.mkdp_highlight_css = os.getenv("HOME") .. "/.cache/wal/colors.css"
vim.g.mkdp_page_title = "${name}.md"
vim.g.mkdp_filetypes = { "markdown", "rmd" }
vim.g.mkdp_command_for_global = 1
vim.g.mkdp_preview_options = {
    katex = {
        macros = {},
    },
    sync_scroll_type = "middle",
    hide_yaml_meta = 1,
    disable_filename = 1,
}
vim.g.mkdp_preview_options.katex.macros["\\st"] = "\\text{ s.t. }"
vim.g.mkdp_markdown_css = vim.fn.fnamemodify(os.getenv("MYVIMRC"), ":h") .. "markdown-preview.css"
vim.cmd([[autocmd FileType markdown,rmd nmap <buffer> <LocalLeader>h <Plug>MarkdownPreviewToggle]])
