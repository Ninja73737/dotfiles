# Path

if test (uname) = "Darwin"
    set -g fish_user_paths "/usr/local/opt/arm-gcc-bin@8/bin" $fish_user_paths
    set -g fish_user_paths "/usr/local/opt/avr-gcc@8/bin" $fish_user_paths
    set -g fish_user_paths "/usr/local/opt/arm-gcc-bin@8/bin" $fish_user_paths
end

set -g fish_user_paths "$HOME/.scripts/" $fish_user_paths

# Aliases

if string match -rq ".*MANJARO-ARM.*" (uname -r)
    alias selfhosting "git --git-dir=$HOME/selfhosting --work-tree=$HOME"

    alias dcu "docker-compose up -d"
    alias dcd "docker-compose down --remove-orphans"
end

alias dotfiles "/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

alias ls "exa -a --icons --group-directories-first"
alias lsd "exa -al --icons --group-directories-first"
alias lst "exa -aT -L 5 --icons --group-directories-first"
alias lsta "exa -aT --icons --group-directories-first"

# Fish Settings

fish_vi_key_bindings

set fish_cursor_default line
set fish_cursor_insert line
set fish_cursor_replace_one line

export VISUAL=nvim
export EDITOR=nvim

# Update wal Colours

if test (uname) = "Darwin"
    set current_wallpaper (osascript -e 'tell app "finder" to get posix path of (get desktop picture as alias)')
    set previous_wallpaper (cat ~/.config/wal/previous_wallpaper)

    set dark_mode (defaults read -g AppleInterfaceStyle 2>/dev/null)
    # set dark_mode (osascript -e 'tell application "System Events" to tell appearance preferences to get dark mode')
    set previous_mode (cat ~/.config/wal/previous_mode)

    if test "$dark_mode" != "$previous_mode" -o $current_wallpaper != $previous_wallpaper
        if test -z "$dark_mode"
        # if test "$dark_mode" = "false"
            wal -c
            wal -i $current_wallpaper -nql
        else
            wal -c
            wal -i $current_wallpaper -nq
        end
    else
        wal -Rnq
    end

    echo $current_wallpaper > ~/.config/wal/previous_wallpaper

    echo $dark_mode > ~/.config/wal/previous_mode

    # Clear screen if running inside ranger

    if test -n "$RANGER_LEVEL"
        clear
    end
end

if string match -rq ".*MANJARO-ARM.*" (uname -r)
    wal -Rnq
end

# Pretty Stuff

if test -z "$SSH_CLIENT"
    clear
end

source ~/.cache/wal/colors.fish

neofetch

starship init fish | source
