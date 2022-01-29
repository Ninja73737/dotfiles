local cmd = vim.cmd

cmd(
    [[autocmd BufNewFile *.md,*.rmd if expand('%:p') !~ '.*/cards/.*' | call nvim_put(["# " .. expand("%:r")], "c", v:false, v:true) | endif]]
)
cmd([[autocmd BufNewFile markdown,rmd call nvim_put(["# " .. expand("%:r")], "c", v:false, v:true)]])
cmd(
    [[autocmd BufRead * if !empty($LF_LEVEL) | call system('lf -remote "send $id cd ' .. expand('%:p:h') .. '" && lf -remote "send $id select ' .. fnameescape(expand('%:t')) .. '"') | endif]]
)
cmd(
    [[au BufReadPost * silent if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' | exe "normal! g`\"zv" | endif]]
)

cmd([[autocmd BufWinEnter,WinEnter term://* startinsert]])
cmd([[autocmd TermOpen * setlocal nonumber norelativenumber]])
