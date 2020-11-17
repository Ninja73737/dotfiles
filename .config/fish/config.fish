# Path

# Time (mean ± σ):       9.2 ms ±   0.9 ms    [User: 6.0 ms, System: 2.9 ms]
# Range (min … max):     8.3 ms …  15.7 ms    243 runs

if test (uname) = "Darwin"
    set -g fish_user_paths "/usr/local/opt/arm-gcc-bin@8/bin" $fish_user_paths
    set -g fish_user_paths "/Users/mtoohey/Library/Python/3.8/bin" $fish_user_paths
end

set -g fish_user_paths "$HOME/.scripts/" $fish_user_paths

if status --is-interactive

    # Aliases

    # Time (mean ± σ):      11.1 ms ±   1.2 ms    [User: 7.3 ms, System: 3.4 ms]
    # Range (min … max):    10.1 ms …  18.3 ms    230 runs

    if string match -rq ".*MANJARO-ARM.*" (uname -r)
        alias selfhosting "git --git-dir=$HOME/.selfhosting --work-tree=$HOME"

        alias dcu "docker-compose --env-file docker-compose.env up -d"
        alias dcd "docker-compose down --remove-orphans"
    end

    alias dotfiles "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

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

    # Fish Settings

    # Time (mean ± σ):      17.1 ms ±   1.4 ms    [User: 13.8 ms, System: 2.9 ms]
    # Range (min … max):    16.1 ms …  29.0 ms    153 runs

    fish_vi_key_bindings

    set fish_cursor_default line
    set fish_cursor_insert line
    set fish_cursor_replace_one line

    export VISUAL=nvim
    export EDITOR=nvim

    # Update wal Colours

    # Time (mean ± σ):     185.4 ms ±   8.4 ms    [User: 114.4 ms, System: 58.0 ms]
    # Range (min … max):   178.4 ms … 207.3 ms    16 runs

    if test (uname) = "Darwin"
        set current_wallpaper (sqlite3 -readonly ~/Library/Application\ Support/Dock/desktoppicture.db 'SELECT * FROM data ORDER BY rowID DESC LIMIT 1;')
        set previous_wallpaper (cat ~/.config/wal/previous_wallpaper)

        set dark_mode (defaults read -g AppleInterfaceStyle 2>/dev/null)
        # set dark_mode (osascript -e 'tell application "System Events" to tell appearance preferences to get dark mode')
        set previous_mode (cat ~/.config/wal/previous_mode)

        if test "$dark_mode" != "$previous_mode" -o $current_wallpaper != $previous_wallpaper
            wal -c
            if test -z "$dark_mode"
            # if test "$dark_mode" = "false"
                wal -i $current_wallpaper -nql
            else
                wal -i $current_wallpaper -nq
            end
            update_spicetify
            # set_macos_accent
            # neofetch > ~/.config/neofetch
        else
            wal -Rnq
        end

        echo $current_wallpaper > ~/.config/wal/previous_wallpaper

        echo $dark_mode > ~/.config/wal/previous_mode
    else if string match -rq ".*MANJARO-ARM.*" (uname -r)
        wal -Rnq
    end

    # Clear screen if running inside ranger

    # Time (mean ± σ):       5.5 ms ±   0.6 ms    [User: 3.5 ms, System: 1.6 ms]
    # Range (min … max):     4.8 ms …  10.3 ms    386 runs

    if test -n "$RANGER_LEVEL"
        clear
    end

    # Pretty Stuff

    if test -n "$SSH_CLIENT"
        clear
    end

    if not string match -rq ".*ish.*" (uname -r)
        if not test -d $HOME/.termux
            source ~/.cache/wal/colors.fish
        end

        neofetch

        starship init fish | source
    end

end
