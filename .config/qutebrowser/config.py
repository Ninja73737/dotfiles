from os.path import expanduser, join
from os import environ
from sys import platform
from subprocess import Popen
import json

command_prefix_list = ['fish', '-c']
if platform == 'darwin':
    command_prefix_string = 'alacritty -t "floatme" -o background_opacity=0.8 -e '
elif 'SWAYSOCK' in environ:
    command_prefix_string = 'alacritty -t "floatme" -o background_opacity=0.8 -e '
elif Popen(['bspc wm -g'], shell=True).wait() == 0:
    command_prefix_string = 'bspc rule -a Alacritty -o state=floating && alacritty -o background_opacity=0.8 -e '
else:
    command_prefix_string = ''

with open(join(expanduser('~'), ".cache/wal/colors.json")) as file:
    pywal = json.load(file)

# Misc
config.load_autoconfig(False)
config.set('statusbar.show', 'never')
config.set('auto_save.session', True)
c.editor.command = command_prefix_list + [command_prefix_string + 'fish -c \'cat ".cache/wal/sequences" && nvim {file}\'']
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
config.bind('<ESC>', 'fake-key <ESC>')
config.unbind('<Ctrl-v>')
config.unbind('<Ctrl-a>')

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

# Fileselect
config.set('fileselect.handler', "external")
# TODO: Force these to validate selections and only show valid options, requires the resolution of gokcehan/lf/issues/642
config.set('fileselect.single_file.command', command_prefix_list + [command_prefix_string + 'fish -c \'cat ".cache/wal/sequences" && lf -command "map <enter> \\${{echo \\"\\$f\\" > {}; lf -remote \\"send \\$id quit\\"}}"\''])
config.set('fileselect.multiple_files.command', command_prefix_list + [command_prefix_string + 'fish -c \'cat ".cache/wal/sequences" && lf -command "map <enter> \\${{echo \\"\\$fx\\" > {}; lf -remote \\"send \\$id quit\\"}}"\''])
config.set('fileselect.folder.command', command_prefix_list + [command_prefix_string + 'fish -c \'cat ".cache/wal/sequences" && lf -command "set dironly; map <enter> \\${{echo \\"\\$f\\" > {}; lf -remote \\"send \\$id quit\\"}}"\''])
