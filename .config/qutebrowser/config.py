# Misc
config.load_autoconfig(False)
config.set('statusbar.show', 'in-mode')
config.set('auto_save.session', True)
c.editor.command = ['fish', '-c', 'bspc rule -a Alacritty -o state=floating && alacritty -e fish -c \'cat ".cache/wal/sequences" && nvim {file}\'']
config.set('content.fullscreen.window', True)
config.set('tabs.show', 'switching')
config.set('tabs.show_switching_delay', 1250)
config.set('tabs.last_close', 'close')
config.set('completion.height', '25%')
config.set('content.headers.do_not_track', None)
config.set('downloads.location.directory', '~/')
config.set('downloads.location.remember', False)
config.set('hints.chars', 'asdfghjkl;qwertyuiopzxcvbnm')
config.set('tabs.title.format', '{current_title}')
config.set('url.start_pages', ['about:blank'])
config.set('scrolling.smooth', True)

# Keybinds
config.bind('<Ctrl-o>', 'set-cmd-text -s :open --window')
config.bind('<Ctrl-Shift-y>',
            'hint links spawn --detach mpv --force-window yes {hint-url}')
config.bind('D', 'close')
config.bind('B', 'spawn --userscript qute-bitwarden')
config.bind('so', 'config-source')
config.bind('e', 'edit-url')
config.bind('(', 'jseval --world=main -f ~/.config/qutebrowser/js/slowDown.js')
config.bind(')', 'jseval --world=main -f ~/.config/qutebrowser/js/speedUp.js')

# Theming
c.fonts.default_size = '12pt'
c.fonts.default_family = 'FiraCode Nerd Font'
c.fonts.web.family.standard = 'SF Pro Text'
c.fonts.web.family.sans_serif = 'SF Pro Text'
c.fonts.web.family.serif = 'New York'
c.fonts.web.family.fixed = 'FiraCode Nerd Font'

config.set('colors.webpage.preferred_color_scheme', 'dark')
config.source('qutewal.py')

# TODO: Set up fileselect configuration options
