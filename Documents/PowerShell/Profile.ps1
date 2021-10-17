# dependencies:
# unknown: git starship powershell7 neovim lf
# winget: Microsoft.Powershell
# choco: starship neovim lf JetBrainsMonoNF
function Dotfiles {
    git.exe --git-dir=$Home/.dotfiles --work-tree=$Home $args
}
Set-Alias -Name dot -Value Dotfiles

set-psreadlineoption -editmode vi
set-psreadlinekeyhandler -chord = -function Complete -vimode Command
set-psreadlinekeyhandler -chord Tab -function Complete

Invoke-Expression (&starship init powershell)
