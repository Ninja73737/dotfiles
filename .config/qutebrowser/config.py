from os.path import expanduser, join
from sys import platform
import json

with open(join(expanduser('~'), ".cache/wal/colors.json")) as file:
    pywal = json.load(file)

# Misc
config.load_autoconfig(False)
config.set('statusbar.show', 'in-mode')
config.set('auto_save.session', True)
if platform == "darwin":
    c.editor.command = ['fish', '-c',
                        'alacritty -t "qutebrowser Editor" -e fish -c \'cat ".cache/wal/sequences" && nvim {file}\'']
else:
    c.editor.command = ['fish', '-c',
                        'bspc rule -a Alacritty -o state=floating && alacritty -e fish -c \'cat ".cache/wal/sequences" && nvim {file}\'']
config.set('content.fullscreen.window', True)
config.set('tabs.show', 'switching')
config.set('tabs.show_switching_delay', 1500)
config.set('tabs.last_close', 'close')
config.set('completion.height', '25%')
config.set('content.headers.do_not_track', None)
config.set('downloads.location.directory', '~/')
config.set('downloads.location.remember', False)
config.set('hints.chars', 'asdfghjkl;qwertyuiopzxcvbnm')
config.set('tabs.title.format', '{current_title}')
config.set('url.start_pages', ['about:blank'])

# Keybinds
config.bind('<Ctrl-o>', 'set-cmd-text -s :open --window')
config.bind('<Ctrl-Shift-y>',
            'hint links spawn --detach mpv --force-window yes {hint-url}')
config.bind('D', 'close')
config.bind('B',
            'spawn --userscript ~/.config/qutebrowser/userscripts/qute-bitwarden')
config.bind('so', 'config-source')
config.bind('e', 'edit-url')
config.bind('(', 'jseval --world=main -f ~/.config/qutebrowser/js/slowDown.js')
config.bind(')', 'jseval --world=main -f ~/.config/qutebrowser/js/speedUp.js')
config.bind(
    '<Ctrl-o>', 'jseval --world=main -f ~/.config/qutebrowser/js/zoomOut.js')
config.bind(
    '<Ctrl-p>', 'jseval --world=main -f ~/.config/qutebrowser/js/zoomIn.js')
config.bind('wp', 'hint links spawn --detach random_bg -l {hint-url}')

# For Fixing: https://github.com/qutebrowser/qutebrowser/issues/2236
config.bind('o', 'set statusbar.show always;; set-cmd-text -s :open')
config.bind('O', 'set statusbar.show always;; set-cmd-text -s :open -t')
config.bind(':', 'set statusbar.show always;; set-cmd-text :')
config.bind('/', 'set-cmd-text /')
config.bind('<Escape>', 'mode-enter normal;; set statusbar.show in-mode',
            mode='command')
config.bind('<Return>', 'command-accept;; set statusbar.show in-mode',
            mode='command')
config.bind('<ESC>', 'fake-key <ESC>')


# Theming
c.fonts.default_size = '12pt'
c.fonts.default_family = 'JetBrainsMono Nerd Font'
c.fonts.web.family.standard = 'SF Pro Text'
c.fonts.web.family.sans_serif = 'SF Pro Text'
c.fonts.web.family.serif = 'New York'
c.fonts.web.family.fixed = 'JetBrainsMono Nerd Font'
config.set('window.transparent', True)

config.set('colors.webpage.preferred_color_scheme', 'dark')
config.source(join(expanduser('~'), '.config/qutebrowser/qutewal/qutewal.py'))

config.set('url.searchengines',
           {'DEFAULT': 'https://duckduckgo.com/?q={}&kt=SF+Pro+Text&kj=' +
            pywal['colors']['color2'] + '&k7=' +
            pywal['special']['background'] + '&kx=' +
            pywal['colors']['color1'] + '&k8' +
            pywal['special']['foreground'] + '&k9' +
            pywal['colors']['color2'] + '&kaa' + pywal['colors']['color2'] + '&kae=d'})

# TODO: Set up fileselect configuration options
