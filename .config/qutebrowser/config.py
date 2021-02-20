config.load_autoconfig(False)
config.bind('<Alt-o>', 'set-cmd-text -s :open --window')
config.bind('<Ctrl-Shift-y>', 'hint links spawn --detach mpv --force-window yes {hint-url}')
c.editor.command = ['alacritty', '-e', 'fish', '-C', "nvim {file}"]
