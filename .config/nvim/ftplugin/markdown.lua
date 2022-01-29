local map = vim.api.nvim_set_keymap

require("output_format/pdf")

vim.o.softtabstop = 1

map(
    "n",
    "<LocalLeader>p",
    [[<CMD>call system('pandoc --metadata-file $HOME/.config/pandoc/default-metadata.yaml -f markdown "' . expand('%:p') . '" -t pdf --pdf-engine=xelatex -o "' . expand('%:p:r') . '.pdf" &')<CR>]],
    {}
)
map(
    "n",
    "<LocalLeader>P",
    [[<CMD>call system('pandoc --metadata-file $HOME/.config/pandoc/default-metadata.yaml -f markdown "' . expand('%:p') . '" -t pdf --pdf-engine=xelatex -o "' . expand('%:p:r') . '.pdf"')<CR>]],
    {}
)
map("n", "<S-CR>", "<CR><CR>---<CR><CR>", { noremap = true })
