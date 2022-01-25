# dependencies:
# unknown: git starship powershell7 neovim lf
# winget: Microsoft.Powershell
# choco: starship neovim lf JetBrainsMonoNF
# TODO: get lf and icons working
$env:Path += ";C:\Users\mtooh\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.9_qbz5n2kfra8p0\LocalCache\local-packages\Python39\Scripts;C:\Program Files\nodejs"

function dot {
    git.exe --git-dir=$Home/.dotfiles --work-tree=$Home $args
}
$env:EDITOR = "nvim"
Set-Alias -Name e -Value $env:EDITOR
Remove-Alias ls
function ls {
    exa -a --icons --group-directories-first $args
}
function ll {
    exa -al --icons --group-directories-first $args
}
function g {
    git $args
}

Set-PSReadlineOption -EditMode vi
Set-PSReadlineOption -BellStyle None
Set-PSReadlineKeyHandler -chord = -function Complete -vimode Command
Set-PSReadlineKeyHandler -chord Tab -function Complete
Set-PSReadlineKeyHandler -chord Ctrl+L -function ClearScreen

Invoke-Expression (&starship init powershell)
