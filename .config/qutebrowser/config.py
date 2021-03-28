# Misc
config.load_autoconfig(False)
config.set('statusbar.show', 'in-mode')
config.set('auto_save.session', True)
c.editor.command = ['alacritty', '-e', 'fish', '-C', "nvim {file}"]

# Keybinds
config.bind('<Ctrl-o>', 'set-cmd-text -s :open --window')
config.bind('<Ctrl-Shift-y>',
            'hint links spawn --detach mpv --force-window yes {hint-url}')
config.bind('D', 'close')
config.bind('B', 'spawn --userscript qute-bitwarden')

# Theming
config.set('colors.webpage.preferred_color_scheme', 'dark')
config.source('qutewal.py')

c.fonts.default_family = 'FiraCode Nerd Font'
c.fonts.default_size = '12pt'
