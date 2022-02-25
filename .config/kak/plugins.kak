evaluate-commands %sh{
    plugins="$kak_config/plugins"
    mkdir -p "$plugins"
    [ ! -e "$plugins/plug.kak" ] && \
        git clone -q https://github.com/andreyorst/plug.kak.git "$plugins/plug.kak"
    printf "%s\n" "source '$plugins/plug.kak/rc/plug.kak'"
}
plug "andreyorst/plug.kak" noload
plug "kak-lsp/kak-lsp" do %{
    cargo install --locked --force --path .
} %{
    lsp-enable
    # TODO: debug this being such a mess
    # lsp-inlay-diagnostics-enable global
}
plug "gitlab.com/Screwtapello/kakoune-state-save"
plug "lePerdu/kakboard" %{
    hook global WinCreate .* %{ kakboard-enable }
}
plug "alexherbo2/auto-pairs.kak" %{
    enable-auto-pairs
    set-option global auto_pairs ( ) { } [ ] '"' '"' "'" "'" ` `
}
# TODO: set this up
# plug "andreyorst/smarttab.kak"
plug "andreyorst/fzf.kak" %{
    map global normal <c-p> ': fzf-mode<ret>'
}
