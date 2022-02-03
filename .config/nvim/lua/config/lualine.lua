local theme = "pywal"

if vim.fn.has("win32") == 1 then
    theme = "palenight"
end

local gps = require("nvim-gps")
require("lualine").setup({
    options = {
        theme = theme,
    },
    sections = {
        lualine_b = { { "b:gitsigns_head", icon = "" } },
        lualine_c = {
            "filename",
            { gps.get_location, cond = gps.is_available },
        },
        lualine_x = { "filetype" },
        lualine_y = {
            {
                function()
                    local wc = vim.fn.wordcount()
                    return tostring(wc.visual_words ~= nil and wc.visual_words or wc.words) .. "W"
                end,
                cond = function()
                    return vim.o.ft == "markdown"
                end,
            },
            "progress",
        },
    },
})
