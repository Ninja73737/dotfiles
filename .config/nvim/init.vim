" " " " " " " " " " " "
" General Vim Settings"
" " " " " " " " " " " "

" Enables relative line numbers
set number relativenumber

" Enables mouse support
set mouse=a

" Sets scroll offsets
set scrolloff=3

set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

set clipboard=unnamedplus

" Disable timeout, which forces the use of mappings that do not overlap each other
set notimeout

" Indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4

set expandtab
set smarttab
set autoindent

filetype plugin indent on

" Search case
set ignorecase
set smartcase

" Hide secondary status indicator
set noshowmode

"" Restore cursor position
au BufReadPost *
         \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' 
         \ |   exe "normal! g`\""
         \ | endif

" " " " " " " " " " " "
" Pre-Plugin Settings "
" " " " " " " " " " " "

" let g:polyglot_disabled = ['autoindent']
set nocompatible

" " " " " "
" Plugins "
" " " " " "

call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'sheerun/vim-polyglot'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install && rm ~/.config/nvim/plugged/markdown-preview.nvim/app/_static/favicon.ico'  }
" Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'norcalli/nvim-colorizer.lua'
" Plug 'dylanaraps/wal.vim'
Plug 'typkrft/wal.vim', { 'as': 'gupywal.vim', 'do':  'sed -i.bak \"s/set cursorline/\\\\" set cursorline/g\" colors/gupywal.vim' }
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
Plug 'dhruvasagar/vim-table-mode'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'ron89/thesaurus_query.vim'
Plug 'chaoren/vim-wordmotion'
Plug 'vim-scripts/loremipsum'
Plug 'vimwiki/vimwiki'
" Plug 'mtoohey31/structure.nvim', { 'do': 'cd rplugin/node/ && npm install && cd ../../frontend/ && npm install && npm run build'}
Plug 'RRethy/vim-illuminate'

call plug#end()

" " " " " " "
" Previewers"
" " " " " " "

let g:mkdp_markdown_css = '/' . join(split($MYVIMRC, '/')[:-2], '/') . '/markdown-preview.css'
let g:mkdp_highlight_css = $HOME . '/.cache/wal/colors.css'
let g:mkdp_page_title = '${name}.md'
let g:mkdp_filetypes = ['markdown', 'pandoc', 'rmarkdown']
let g:mkdp_command_for_global = 1

let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
autocmd FileType vimwiki setlocal syntax=pandoc
autocmd FileType vimwiki setlocal commentstring=<!--%s-->
let g:vimwiki_conceallevel = 0
let g:vimwiki_key_mappings = { 'all_maps': 0, }

let os = substitute(system('uname'), "\n", "", "")
if os == "Darwin"
    let g:livepreview_previewer = 'open -a Preview'
    let g:pandoc_preview_pdf_cmd = 'open -a Preview'
elseif os == "Linux"
    let g:livepreview_previewer = 'zathura'
    let g:pandoc_preview_pdf_cmd = 'zathura'
endif
let g:livepreview_cursorhold_recompile = 0

function! PandocPreview ()
  let output_path = join(split(expand('%:p'), '\.')[:-2], '.') . '.pdf'
  execute '!pandoc -f markdown "' . expand('%:p') . '" -t pdf --pdf-engine=xelatex -o "' . output_path . '"'
endfunction

function! ZathuraCurrent ()
  let output_path = join(split(expand('%:p'), '\.')[:-2], '.') . '.pdf'
  execute '!zathura "' .output_path . '"'
endfunction

" " " " " " " " " " " " " " " " " "
" Linters and Syntax Highlighters "
" " " " " " " " " " " " " " " " " "

autocmd VimEnter * hi illuminatedWord cterm=underline gui=underline
let g:Illuminate_highlightUnderCursor = 0

let g:rainbow_active = 1

let g:pandoc#modules#disabled = ["folding", "spell"]
let g:pandoc#syntax#conceal#use = 0

let g:tq_mthesaur_file="~/.config/nvim/mthesaur.txt"
let g:tq_enabled_backends=["mthesaur_txt"]

let g:coc_filetype_map = { 'pandoc': 'markdown' , 'rmarkdown': 'markdown', 'vimwiki': 'markdown' }

let g:coc_global_extensions = ["coc-css", "coc-db", "coc-diagnostic", "coc-docker", "coc-fish", "coc-flutter", "coc-git", "coc-gitignore", "coc-homeassistant", "coc-html", "coc-java", "coc-json", "coc-markdownlint", "coc-marketplace", "coc-pairs", "coc-prettier", "coc-pyright", "coc-rls", "coc-sh", "coc-spell-checker", "coc-svelte", "coc-texlab", "coc-toml", "coc-tslint", "coc-tsserver", "coc-webpack", "coc-vimtex", "coc-xml", "coc-yaml"]

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=8
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=8

" " " " " " " " " " " " " " " 
" Navigation and Remappings "
" " " " " " " " " " " " " " "

let g:EasyMotion_smartcase = 1

noremap ZQ :quit!<CR>
noremap ZW :write<CR>

autocmd User EasyMotionPromptBegin silent! CocDisable
autocmd User EasyMotionPromptEnd silent! CocEnable

noremap! <C-BS> <C-w>
" Necessary for the backspace remap above for some reason...
noremap! <C-h> <C-w>
map f <Plug>(easymotion-s2)
noremap cf :CocFix<CR>
nmap cF <Plug>(coc-codeaction)
noremap cm :call CocAction('format')<CR>
noremap cn :call CocAction('diagnosticNext')<CR>
noremap cN :call CocAction('diagnosticPrevious')<CR>

noremap ch :noh<CR>
noremap ct :TableModeToggle<CR>

noremap cpl :LLPStartPreview<CR>
nmap cpm <Plug>MarkdownPreviewToggle
noremap cprh :silent write <bar> RMarkdown html<CR>
noremap cprH :silent write <bar> RMarkdown! html<CR>
noremap cprp :silent write <bar> RMarkdown pdf<CR>
noremap cprP :silent write <bar> RMarkdown! pdf<CR>
noremap cpp :silent write <bar> call PandocPreview()<CR>
noremap cpP :silent write <bar> call PandocPreview() <bar> silent call ZathuraCurrent()<CR>
noremap cz :silent call ZathuraCurrent()<CR>
noremap cpy :silent !wal -R<CR>

noremap gCC :silent write <bar> :!gcc % && ./a.out<CR>

" " " " " " " " " " " " " " " "
" FileType Dependent Settings "
" " " " " " " " " " " " " " " "

autocmd FileType tex let b:coc_pairs_disabled = ['<']
autocmd FileType pandoc let b:coc_pairs_disabled = ['<']
autocmd FileType pandoc let g:table_mode_corner='|'
autocmd FileType markdown,rmarkdown,vimwiki,tex let b:coc_pairs = [["$", "$"]]

" autocmd FileType pandoc set colorcolumn=81
" autocmd FileType pandoc set tw=80
" autocmd FileType pandoc set formatoptions+=t
" autocmd FileType rmarkdown set colorcolumn=81
" autocmd FileType rmarkdown set tw=80
" autocmd FileType rmarkdown set formatoptions+=t
autocmd FileType python set colorcolumn=101

" autocmd FileType pandoc set tabstop=3
" autocmd FileType pandoc set shiftwidth=3
" autocmd FileType pandoc set softtabstop=3

" Enables true color and colorizer
" set termguicolors
" lua require'colorizer'.setup()

" " " " " "
" Airline "
" " " " " "

" let g:airline_section_c = airline#section#create_left(["%{join(split(expand('%:p'), '/')[-3:], '/')}"])
let g:airline_section_y = ''
let g:airline_section_z = airline#section#create_right(['%{virtcol(".")}x%{line(".")}/%{line("$")}'])
let g:airline_theme='wal'
let g:airline_skip_empty_sections = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
" let g:airline_symbols_branch = ''
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#wordcount#filetypes =
  \ ['asciidoc', 'help', 'mail', 'markdown', 'nroff', 'org', 'plaintex', 'pandoc', 'rmarkdown', 'rst', 'tex', 'text', 'vimwiki']

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
    " colorscheme wal
    colorscheme gupywal
endif

" let g:struct_filetypes = ['markdown', 'vimwiki', 'pandoc', 'rmarkdown']
" let g:struct_autostart = 1
" let g:struct_refocus_bspwm = 1
