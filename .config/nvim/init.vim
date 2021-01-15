call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-sleuth'
Plug 'sheerun/vim-polyglot'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install && rm ~/.config/nvim/plugged/markdown-preview.nvim/app/_static/favicon.ico'  }
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-highlightedyank'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'dylanaraps/wal.vim'
" Plug 'typkrft/wal.vim', { 'as': 'gupywal.vim' }
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
Plug 'dhruvasagar/vim-table-mode'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'unblevable/quick-scope'
Plug 'Yggdroot/indentLine'
Plug 'easymotion/vim-easymotion'
Plug 'ron89/thesaurus_query.vim'

call plug#end()

let g:pandoc#modules#disabled = ["folding", "spell"]
let g:pandoc#syntax#conceal#use = 0

let g:EasyMotion_smartcase = 1

let g:tq_mthesaur_file="~/.config/nvim/mthesaur.txt"
let g:tq_enabled_backends=["mthesaur_txt"]

let g:coc_filetype_map = { 'pandoc': 'markdown' }
" let g:coc_filetype_map = { 'pandoc': 'markdown' , 'rmarkdown': 'markdown' }
" goal

let g:coc_global_extensions = ["coc-css", "coc-db", "coc-docker", "coc-eslint", "coc-fish", "coc-git", "coc-gitignore", "coc-homeassistant", "coc-html", "coc-java", "coc-json", "coc-markdownlint", "coc-marketplace", "coc-pairs", "coc-prettier", "coc-pyright", "coc-rls", "coc-sh", "coc-spell-checker", "coc-svelte", "coc-texlab", "coc-toml", "coc-tslint", "coc-webpack", "coc-vimtex", "coc-xml", "coc-yaml"]

noremap Q <Nop>
noremap ZQ :quit!<CR>
noremap ZW :write<CR>

map f <Plug>(easymotion-s2)
noremap cf :CocFix<CR>
noremap cF :call CocAction('format')<CR>
noremap cn :call CocAction('diagnosticNext')<CR>
noremap cp :call CocAction('diagnosticPrevious')<CR>

noremap ch :noh<CR>
noremap ct :TableModeToggle<CR>

noremap cs :autocmd TextChanged,TextChangedI <buffer> silent write<CR>

autocmd FileType tex let b:coc_pairs_disabled = ['<']
autocmd FileType pandoc let g:table_mode_corner='|'
" let g:table_mode_corner='|'

autocmd FileType pandoc set colorcolumn=81
autocmd FileType pandoc set tw=80
autocmd FileType rmarkdown set colorcolumn=81
autocmd FileType rmarkdown set tw=80
autocmd FileType rmarkdown set formatoptions+=t
autocmd FileType python set colorcolumn=101

noremap Rh :silent write <bar> RMarkdown! html<CR>
noremap RH :silent write <bar> RMarkdown! html<CR>
noremap Rp :silent write <bar> RMarkdown! pdf<CR>
noremap RP :silent write <bar> RMarkdown! pdf<CR>
autocmd FileType rmarkdown noremap ZW :silent write <bar> RMarkdown! html<CR>
autocmd FileType rmarkdown noremap ZZ :silent write <bar> RMarkdown! pdf<CR><bar> :quit<CR>

noremap LL :LLPStartPreview<CR>

let g:mkdp_auto_start = 1
let g:mkdp_markdown_css = '/Users/mtoohey/.config/nvim/markdown-preview.css'
let g:mkdp_highlight_css = '/Users/mtoohey/.cache/wal/colors.css'
let g:mkdp_page_title = '${name}.md'

let os = substitute(system('uname'), "\n", "", "")
if os == "Darwin"
    let g:livepreview_previewer = 'open -a Preview'
elseif os == "Linux"
    let g:livepreview_previewer = 'zathura'
endif
let g:livepreview_cursorhold_recompile = 0

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Enables true color and colorizer
" set termguicolors
" lua require'colorizer'.setup()

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

" Will automatically switch to case sensitive if you use any capitals
set ignorecase
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

" Restore last cursor position and marks on open
au BufReadPost *
         \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' 
         \ |   exe "normal! g`\""
         \ | endif

let g:airline_theme='wal'
" let g:airline_theme='gupywal'
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
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#wordcount#filetypes =
  \ ['asciidoc', 'help', 'mail', 'markdown', 'nroff', 'org', 'plaintex', 'rmarkdown', 'rst', 'tex', 'text']
"extension settings
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
let airline#extensions#coc#warning_symbol = ':'
let airline#extensions#coc#error_symbol = ':'

if exists('g:started_by_firenvim')
    colorscheme nord
    call timer_start(0, 'Hide_Bar')
    function! Hide_Bar(timer) abort
        set laststatus=0
    endfunction
    " set guifont=FiraCode:h14

    let g:dont_write = v:false
    function! My_Write(timer) abort
	let g:dont_write = v:false
	write
    endfunction

    function! Delay_My_Write() abort
	if g:dont_write
            return
	end
	let g:dont_write = v:true
	call timer_start(3000, 'My_Write')
    endfunction

    au TextChanged * ++nested call Delay_My_Write()
    au TextChangedI * ++nested call Delay_My_Write()

else
    colorscheme wal
    " colorscheme gupywal
endif
