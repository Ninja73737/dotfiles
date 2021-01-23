# Path

if test (uname) = "Darwin"
    set -g fish_user_paths "/usr/local/opt/arm-gcc-bin@8/bin" $fish_user_paths
end
set -g fish_user_paths "$HOME/.scripts/" $fish_user_paths
set -g fish_user_paths "$HOME/.local/bin" $fish_user_paths
set -g fish_user_paths "$HOME/.cargo/bin" $fish_user_paths
set -g fish_user_paths "$HOME/.gem/ruby/2.7.0/bin" $fish_user_paths
if status --is-interactive

    # Aliases

    if test (uname) = "Darwin"
        alias cdic "cd '/Users/mtoohey/Library/Mobile Documents/'"
    end

    alias dcu "docker-compose --env-file docker-compose.env up -d --remove-orphans"
    alias dcd "docker-compose down --remove-orphans"

    alias lg "lazygit"

    if string match -rq ".*MANJARO-ARM.*" (uname -r)
        alias selfhosting "git --git-dir=$HOME/.selfhosting --work-tree=$HOME"
        alias lsh "lazygit --git-dir=$HOME/.selfhosting --work-tree=$HOME"
    end

    alias dotfiles "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
    alias ldf "lazygit --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

    alias R "R --no-save"

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

    export VISUAL=nvim
    export EDITOR=nvim

    # Update wal Colours

    if test (uname) = "Darwin"
        # # wal --theme base16-nord -nq

        # # set current_wallpaper (sqlite3 -readonly ~/Library/Application\ Support/Dock/desktoppicture.db 'SELECT * FROM data ORDER BY rowID DESC LIMIT 1;')
        # set current_wallpaper (osascript -e 'tell app "finder" to get posix path of (get desktop picture as alias)')

        # set dark_mode (defaults read -g AppleInterfaceStyle 2>/dev/null)
        # # set dark_mode (osascript -e 'tell application "System Events" to tell appearance preferences to get dark mode')

        # if test -z "$dark_mode"
        # # if test "$dark_mode" = "false"
        #     wal -i $current_wallpaper -nql
        # else
        #     wal -i $current_wallpaper -nq
        # end
        # update_spicetify
    else if string match -rq ".*MANJARO-ARM.*" (uname -r)
        # wal --theme base16-nord -q
    end

    if test "$TERM_PROGRAM" = "alacritty"
        cat ~/.cache/wal/sequences
    else
        wal -Rnq
    end

    # Clear screen if running inside ranger or over ssh

    if test -n "$RANGER_LEVEL" -o -n "$SSH_CLIENT"
        clear
    end

    # Pretty Stuff

    if not string match -rq ".*ish.*" (uname -r)
        if not test -d $HOME/.termux
            source ~/.cache/wal/colors.fish
        end

        neofetch

        starship init fish | source
    end

end
