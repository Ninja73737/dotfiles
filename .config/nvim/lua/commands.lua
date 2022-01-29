local cmd = vim.cmd

cmd([[command! DebugMap redir @" | silent map | redir END | new | put!]])
cmd([[command! DebugHi redir @" | silent hi | redir END | new | put!]])
cmd(
    [[command! DebugCurrentHi echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"]]
)
