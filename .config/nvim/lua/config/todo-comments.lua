require("todo-comments").setup({
    keywords = { QUESTION = { icon = "?", color = "error" } },
    highlight = {
        pattern = [[.*<(KEYWORDS)\s*:?]],
    },
    pattern = [[\b(KEYWORDS)\b]],
})
