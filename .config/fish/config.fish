# Paths

if test (uname) = "Darwin"
    set -g fish_user_paths "/usr/local/opt/arm-gcc-bin@8/bin" $fish_user_paths
end
set -g fish_user_paths "$HOME/.scripts/" $fish_user_paths
set -g fish_user_paths "$HOME/.local/bin" $fish_user_paths
set -g fish_user_paths "$HOME/.cargo/bin" $fish_user_paths
set -g fish_user_paths "$HOME/.gem/ruby/2.7.0/bin" $fish_user_paths

if test -d /opt/android-sdk/cmdline-tools/latest/bin
    set -g fish_user_paths "/opt/android-sdk/cmdline-tools/latest/bin" $fish_user_paths
end

# Aliases and Functions

abbr dcu "docker-compose --env-file docker-compose.env up -d --remove-orphans"
abbr dcd "docker-compose down --remove-orphans"

abbr lg "lazygit"
alias lg "lazygit"

abbr vf "nvim -c 'G | only'"
alias vf "nvim -c 'G | only'"

if string match -rq ".*MANJARO-ARM.*" (uname -r)
    abbr selfhosting "git --git-dir=\$HOME/.selfhosting --work-tree=\$HOME"
    abbr lsh "lazygit --git-dir=\$HOME/.selfhosting --work-tree=\$HOME"
end

abbr dotfiles "git --git-dir=\$HOME/.dotfiles/ --work-tree=\$HOME"
abbr ldf "lazygit --git-dir=\$HOME/.dotfiles/ --work-tree=\$HOME"

if which trash &> /dev/null
    abbr rm "trash"
    alias rm "trash"
end

if which trash-restore &> /dev/null
    # Credit for this one-liner goes to @norcalli here: https://github.com/andreafrancia/trash-cli/issues/107#issuecomment-479241828
    alias trash-undo "echo '' | trash-restore 2>/dev/null | sed '\$d' | sort -k2,3 -k1,1n | awk 'END {print \$1}' | trash-restore >/dev/null 2>&1"
end

abbr v "nvim"
abbr nv "nvim"
alias vi "nvim"
alias vim "nvim"

function sc
    sc-im $argv
    cat $HOME/.cache/wal/sequences
end

abbr zth "zathura --fork"
alias zth "zathura --fork"
alias R "R --quiet --no-save"
alias python "python -q"
alias python2 "python2 -q"
alias python3 "python3 -q"

if test -d $HOME/.termux
    alias ls "exa -a --group-directories-first"
    alias lsd "exa -al group-directories-first"
    alias lst "exa -aT -L 5 group-directories-first"
    alias lsta "exa -aT group-directories-first"
else if not string match -rq ".*ish.*" (uname -r)
    alias ls "exa -a --icons --group-directories-first"
    alias lsd "exa -al --icons --group-directories-first"
    alias lst "exa -aT -L 5 --icons --group-directories-first"
    alias lsta "exa -aT --icons --group-directories-first"
end

function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

# Fish Settings

fish_vi_key_bindings

set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore

# Environment Variables

export VISUAL=nvim
export EDITOR=nvim

if status --is-interactive

    # Pretty Stuff

    # LF Icons

    source $HOME/.config/lf/icons

    # Clear screen if running inside ranger or over ssh

    if test -n "$SSH_CONNECTION"
        set -U fish_color_autosuggestion      brblack
        set -U fish_color_cancel              -r
        set -U fish_color_command             brgreen
        set -U fish_color_comment             brmagenta
        set -U fish_color_cwd                 green
        set -U fish_color_cwd_root            red
        set -U fish_color_end                 brmagenta
        set -U fish_color_error               brred
        set -U fish_color_escape              brcyan
        set -U fish_color_history_current     --bold
        set -U fish_color_host                normal
        set -U fish_color_match               --background=brblue
        set -U fish_color_normal              normal
        set -U fish_color_operator            cyan
        set -U fish_color_param               brblue
        set -U fish_color_quote               yellow
        set -U fish_color_redirection         bryellow
        set -U fish_color_search_match        'bryellow' '--background=brblack'
        set -U fish_color_selection           'white' '--bold' '--background=brblack'
        set -U fish_color_status              red
        set -U fish_color_user                brgreen
        set -U fish_color_valid_path          --underline
        set -U fish_pager_color_completion    normal
        set -U fish_pager_color_description   yellow
        set -U fish_pager_color_prefix        'white' '--bold' '--underline'
        set -U fish_pager_color_progress      'brwhite' '--background=cyan'

        clear
    else
        cat ~/.cache/wal/sequences
        source ~/.cache/wal/colors.fish
    end

    if which neofetch &> /dev/null
        neofetch
    end

    if which starship &> /dev/null
        starship init fish | source
    end
end
