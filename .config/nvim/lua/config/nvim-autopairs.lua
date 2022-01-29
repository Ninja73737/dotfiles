-- TODO: set up smart pairs for markdown once I have a decent tree-sitter grammar
-- include _, __, *, **, $, $$, `, ```
-- exclude escaped versions and characters inside math or code scopes that shouldn't be valid there
local pairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")
pairs.setup({
    disable_filetype = { "TelescopePrompt" },
})
pairs.add_rule(Rule("<", ">", "rust"):with_pair(cond.not_before_regex_check("[%d ]")))
