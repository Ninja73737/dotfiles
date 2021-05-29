if test -z "$DISPLAY"
    if test -n "$SSH_CONNECTION" -a ! -n "$TMUX"
        if status --is-interactive
            exec tmux
        end
    else if test -n "$XDG_VTNR" -a "$XDG_VTNR" -eq 1
        export _JAVA_AWT_WM_NONREPARENTING=1
        exec startx
    end
end

if test (uname) = "Darwin"
    set -g fish_user_paths "/usr/local/opt/arm-gcc-bin@8/bin" $fish_user_paths
end
set -g fish_user_paths "$HOME/.scripts" $fish_user_paths
set -g fish_user_paths "$HOME/.local/bin" $fish_user_paths
set -g fish_user_paths "$HOME/.cargo/bin" $fish_user_paths
set -g fish_user_paths "$HOME/.gem/ruby/2.7.0/bin" $fish_user_paths
set -g fish_user_paths "$HOME/.npm-global/" $fish_user_paths
set -g fish_user_paths "$HOME/.pnpm-global/bin/" $fish_user_paths

# TODO: Remove this temporary export
set -g fish_user_paths "$HOME/taskmatter" $fish_user_paths

abbr tm "taskmatter"
alias tm "taskmatter"

set -x GOPATH "$HOME/.go"

if test -d $HOME/.go
    set -g fish_user_paths "$HOME/.go/bin" $fish_user_paths
end

if test -d /opt/android-sdk/cmdline-tools/latest/bin
    set -g fish_user_paths "/opt/android-sdk/cmdline-tools/latest/bin" $fish_user_paths
end

abbr dcu "docker-compose --env-file docker-compose.env up -d --remove-orphans"
abbr dcd "docker-compose down --remove-orphans"

abbr pcp "rsync -r --info=progress2"
alias pcp "rsync -r --info=progress2"

if string match -rq ".*MANJARO-ARM.*" (uname -r)
    abbr selfhosting "git --git-dir=\$HOME/.selfhosting --work-tree=\$HOME"
    abbr lsh "lazygit --git-dir=\$HOME/.selfhosting --work-tree=\$HOME"
end

abbr dot "git --git-dir=\$HOME/.dotfiles/ --work-tree=\$HOME"
alias dot "git --git-dir=\$HOME/.dotfiles/ --work-tree=\$HOME"

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

function prompt
    while read cmd -S -c "$argv " -p fish_prompt -R fish_right_prompt
        eval $cmd
    end
end

abbr pg "prompt git"
alias pg "prompt git"

fish_vi_key_bindings

set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore

export VISUAL=(which nvim)
export EDITOR=(which nvim)

if status --is-interactive
    source $HOME/.config/lf/icons

    if test -z "$SSH_CONNECTION"
        cat ~/.cache/wal/sequences
    end

    if which starship &> /dev/null
        starship init fish | source
    end
end
