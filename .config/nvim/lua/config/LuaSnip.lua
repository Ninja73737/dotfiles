require("luasnip.loaders.from_vscode").load()

local luasnip = require("luasnip")

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.tab_complete = function()
    if luasnip.jumpable(1) then
        return t("<Plug>luasnip-jump-next")
    elseif luasnip.expandable() then
        return t("<Plug>luasnip-expand-snippet")
    elseif vim.o.ft == "markdown" then
        return t("<C-t>")
    else
        return t("<C-t>")
    end
end

_G.s_tab_complete = function()
    if luasnip.jumpable(-1) then
        return t("<Plug>luasnip-jump-prev")
    elseif vim.o.ft == "markdown" then
        return t("<C-d>")
    else
        return t("<C-d>")
    end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", { expr = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
