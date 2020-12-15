call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-sleuth'
Plug 'sheerun/vim-polyglot'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-highlightedyank'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'dylanaraps/wal.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

nmap cf :call CocAction('format')<CR>
nmap cn :call CocAction('diagnosticNext')<CR>
nmap cp :call CocAction('diagnosticPrevious')<CR>

:map Q <Nop>
nmap ZQ :quit!<CR>

let g:mkdp_auto_start = 1
let g:mkdp_markdown_css = '/Users/mtoohey/.config/nvim/markdown-preview.css'
let g:mkdp_highlight_css = '/Users/mtoohey/.cache/wal/colors.css'

let os = substitute(system('uname'), "\n", "", "")
if os == "Darwin"
    let g:livepreview_previewer = 'open -a Preview'
elseif os == "Linux"
    let g:livepreview_previewer = 'zathura'
endif
let g:livepreview_cursorhold_recompile = 0

" Enables true color and colorizer
set termguicolors
lua require'colorizer'.setup()

" Enables relative line numbers
set number relativenumber

" Enables mouse support
set mouse=a

" Sets scroll offsets
set scrolloff=3

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
" set matchpairs+=<:>

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Use system clipboard
set clipboard=unnamedplus

" Remove timeout for partially typed commands
set notimeout

" Indentation
set smarttab
set expandtab
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent

filetype plugin indent on

"Will automatically switch to case sensitive if you use any capitals
set smartcase

let g:goyo_width = '95%'
let g:goyo_height = '95%'

function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Allow color schemes to do bright colors without forcing bold.
" if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
"   set t_Co=16
" endif

" Colorscheme
colorscheme wal

" Restore last cursor position and marks on open
au BufReadPost *
         \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' 
         \ |   exe "normal! g`\""
         \ | endif

let g:airline_theme='wal'
let g:airline_powerline_fonts = 1
let g:airline_symbols = {}
let g:airline_skip_empty_sections = 1
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_symbols_branch = ''
let g:airline_powerline_fonts = 1
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
"extensions
let g:airline#extensions#coc#enabled = 1
"extension settings
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
let airline#extensions#coc#warning_symbol = ':'
let airline#extensions#coc#error_symbol = ':'
