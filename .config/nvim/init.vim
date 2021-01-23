" " " " " " " " " " " "
" Pre-Plugin Settings "
" " " " " " " " " " " "

let g:polyglot_disabled = ['autoindent']
set nocompatible

" " " " " "
" Plugins "
" " " " " "

call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-sleuth'
Plug 'sheerun/vim-polyglot'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'lingnand/pandoc-preview.vim',
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install && rm ~/.config/nvim/plugged/markdown-preview.nvim/app/_static/favicon.ico'  }
Plug 'tpope/vim-commentary'
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
Plug 'Yggdroot/indentLine'
Plug 'easymotion/vim-easymotion'
Plug 'ron89/thesaurus_query.vim'

call plug#end()

" " " " " " "
" Previewers"
" " " " " " "

let g:mkdp_markdown_css = '/' . join(split($MYVIMRC, '/')[0:-2], '/') . '/markdown-preview.css'
let g:mkdp_highlight_css = $HOME . '/.cache/wal/colors.css'
let g:mkdp_page_title = '${name}.md'

let os = substitute(system('uname'), "\n", "", "")
if os == "Darwin"
    let g:livepreview_previewer = 'open -a Preview'
    let g:pandoc_preview_pdf_cmd = 'open -a Preview'
elseif os == "Linux"
    let g:livepreview_previewer = 'zathura'
    let g:pandoc_preview_pdf_cmd = 'zathura'
endif
let g:livepreview_cursorhold_recompile = 0

" " " " " " " " " " " " " " " " " "
" Linters and Syntax Highlighters "
" " " " " " " " " " " " " " " " " "

let g:rainbow_active = 1

let g:pandoc#modules#disabled = ["folding", "spell"]
let g:pandoc#syntax#conceal#use = 0

let g:tq_mthesaur_file="~/.config/nvim/mthesaur.txt"
let g:tq_enabled_backends=["mthesaur_txt"]

let g:coc_filetype_map = { 'pandoc': 'markdown' }
" let g:coc_filetype_map = { 'pandoc': 'markdown' , 'rmarkdown': 'markdown' }
" goal

let g:coc_global_extensions = ["coc-css", "coc-db", "coc-diagnostic", "coc-docker", "coc-eslint", "coc-fish", "coc-git", "coc-gitignore", "coc-homeassistant", "coc-html", "coc-java", "coc-json", "coc-markdownlint", "coc-marketplace", "coc-pairs", "coc-prettier", "coc-pyright", "coc-rls", "coc-sh", "coc-spell-checker", "coc-svelte", "coc-texlab", "coc-toml", "coc-tslint", "coc-webpack", "coc-vimtex", "coc-xml", "coc-yaml"]

" " " " " " " " " " " " " " " 
" Navigation and Remappings "
" " " " " " " " " " " " " " "

let g:EasyMotion_smartcase = 1

noremap ZQ :quit!<CR>
noremap ZW :write<CR>

autocmd User EasyMotionPromptBegin silent! CocDisable
autocmd User EasyMotionPromptEnd silent! CocEnable

map f <Plug>(easymotion-s2)
noremap cf :CocFix<CR>
nmap cF <Plug>(coc-codeaction)
noremap cm :call CocAction('format')<CR>
noremap cn :call CocAction('diagnosticNext')<CR>
noremap cp :call CocAction('diagnosticPrevious')<CR>

noremap ch :noh<CR>
noremap ct :TableModeToggle<CR>

noremap cpl :LLPStartPreview<CR>
noremap cpm :MarkdownPreviewToggle<CR>
noremap cprh :silent write <bar> RMarkdown html<CR>
noremap cprH :silent write <bar> RMarkdown! html<CR>
noremap cprp :silent write <bar> RMarkdown pdf<CR>
noremap cprP :silent write <bar> RMarkdown! pdf<CR>
noremap cpp :PandocPreview<CR>

" " " " " " " " " " " " " " " "
" FileType Dependent Settings "
" " " " " " " " " " " " " " " "

autocmd FileType tex let b:coc_pairs_disabled = ['<']
autocmd FileType pandoc let g:table_mode_corner='|'

autocmd FileType pandoc set colorcolumn=81
autocmd FileType pandoc set tw=80
autocmd FileType rmarkdown set colorcolumn=81
autocmd FileType rmarkdown set tw=80
autocmd FileType rmarkdown set formatoptions+=t
autocmd FileType python set colorcolumn=101

" Enables true color and colorizer
" set termguicolors
" lua require'colorizer'.setup()

" " " " " " " " " " " "
" General Vim Settings"
" " " " " " " " " " " "

" Enables relative line numbers
set number relativenumber

" Enables mouse support
set mouse=a

" Sets scroll offsets
set scrolloff=3

" Highlight matching pairs of brackets. Use the '%' character to jump between them.

set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

set clipboard=unnamedplus

set notimeout

" Indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4

set expandtab
set smarttab
set autoindent

filetype plugin indent on

set ignorecase
set smartcase

"" Restore cursor position
au BufReadPost *
         \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' 
         \ |   exe "normal! g`\""
         \ | endif

" Airline
" " " " " " " " " " " " " " " "
" Firenvim Dependent Settings "
" " " " " " " " " " " " " " " "

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
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#wordcount#filetypes =
  \ ['asciidoc', 'help', 'mail', 'markdown', 'nroff', 'org', 'plaintex', 'rmarkdown', 'rst', 'tex', 'text']
"extension settings
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
let airline#extensions#coc#warning_symbol = ':'
let airline#extensions#coc#error_symbol = ':'

" " " " " " " " " " " " " " " "
" Firenvim Dependent Settings "
" " " " " " " " " " " " " " " "

if exists('g:started_by_firenvim')
    colorscheme nord
    call timer_start(0, 'Hide_Bar')
    function! Hide_Bar(timer) abort
        set laststatus=0
    endfunction
    set guifont=FiraCode:h12

    let g:dont_write = v:false
    function! Autowrite(timer) abort
	let g:dont_write = v:false
	write
    endfunction

    function! Delay_Autowrite() abort
	if g:dont_write
            return
	end
	let g:dont_write = v:true
	call timer_start(3000, 'Autowrite')
    endfunction

    au TextChanged * ++nested call Delay_Autowrite()
    au TextChangedI * ++nested call Delay_Autowrite()

else
    colorscheme wal
    " colorscheme gupywal
endif
