" =============================================================================
" Filename: autoload/lightline/colorscheme/pywal.vim
" Author: mtoohey31
" License: MIT License
" Last Change: 2021/03/16 15:41:38.
" =============================================================================
source $HOME/.cache/wal/colors-wal.vim

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left = [ [ background, color1 ], [ background, color8 ] ]
let s:p.normal.middle = [ [ foreground, background ] ]
let s:p.normal.right = [ [ background, color1 ], [ background, color8 ] ]
let s:p.normal.warning = [ [ background, color4 ] ]
let s:p.normal.error = [ [ background, color2 ] ]

let s:p.inactive.left =  [ [ foreground, color1 ], [ foreground, color8 ] ]
let s:p.inactive.middle = [ [ foreground, background ] ]
let s:p.inactive.right = [ [ foreground, color1 ], [ foreground, color8 ] ]

let s:p.insert.left = [ [ background, color5 ], [ background, color8 ] ]
let s:p.insert.right = [ [ background, color5 ], [ background, color8 ] ]

let s:p.replace.left = [ [ background, color2 ], [ background, color8 ] ]
let s:p.replace.right = [ [ background, color2 ], [ background, color8 ] ]

let s:p.visual.left = [ [ background, color4 ], [ background, color8 ] ]
let s:p.visual.right = [ [ background, color4 ], [ background, color8 ] ]

let s:p.tabline.left = [ [ foreground, background ] ]
let s:p.tabline.middle = [ [ foreground, background ] ]
let s:p.tabline.right = [ [ foreground, background ] ]
let s:p.tabline.tabsel = [ [ background, color1 ] ]

let g:lightline#colorscheme#pywal#palette = lightline#colorscheme#fill(s:p)
