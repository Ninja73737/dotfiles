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
" set tabstop=4
" set shiftwidth=4
" set softtabstop=4

set expandtab
set smarttab
set autoindent

filetype plugin indent on

" Search case
set ignorecase
set smartcase

" Command completion
" set wildmenu
" set wildmode=longest,list,full

" Syntax
syntax on

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

" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install && rm ~/.config/nvim/plugged/markdown-preview.nvim/app/_static/favicon.ico'  }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'mtoohey31/tgc_wal.vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
Plug 'dhruvasagar/vim-table-mode'
Plug 'easymotion/vim-easymotion'
Plug 'ron89/thesaurus_query.vim'
Plug 'chaoren/vim-wordmotion'
Plug 'vim-scripts/loremipsum'
Plug 'vimwiki/vimwiki'
Plug 'itchyny/lightline.vim'
Plug 'ferrine/md-img-paste.vim'
Plug 'mtoohey31/doctest.nvim'
Plug 'reedes/vim-pencil'
Plug 'tools-life/taskwiki'

call plug#end()

" " " " " " "
" Previewers"
" " " " " " "

let g:mdip_imgdir = expand('%:t:r')
let g:mdip_imgdir_intext = escape(expand('%:t:r'), ' ')

let g:mkdp_markdown_css = '/' . join(split($MYVIMRC, '/')[:-2], '/') . '/markdown-preview.css'
let g:mkdp_highlight_css = $HOME . '/.cache/wal/colors.css'
let g:mkdp_page_title = '${name}.md'
let g:mkdp_filetypes = ['markdown', 'pandoc', 'rmd']
let g:mkdp_command_for_global = 1

let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
autocmd FileType vimwiki setlocal syntax=pandoc
autocmd FileType vimwiki setlocal commentstring=<!--%s-->
let g:vimwiki_conceallevel = 0

let g:pencil#wrapModeDefault = 'soft'
autocmd BufNewFile,BufRead *.tex call pencil#init()

autocmd BufNewFile,BufRead *.tex setlocal syntax=pandoc

autocmd BufNewFile,BufRead *.Rmd set filetype=rmd
autocmd BufNewFile,BufRead *.pmd set filetype=pandoc | PandocHighlight python

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
  let output_path = expand('%:p:r') . '.pdf'
  execute '!pandoc --metadata-file $HOME/.config/pandoc/default-metadata.yaml -f markdown "' . expand('%:p') . '" -t pdf --pdf-engine=xelatex -o "' . output_path . '"'
  " execute '!pandoc --highlight-style $HOME/.config/pandoc/nord.theme --metadata-file $HOME/.config/pandoc/default-metadata.yaml -f markdown "' . expand('%:p') . '" -t pdf --pdf-engine=xelatex -o "' . output_path . '"'
endfunction

function! ZathuraCurrent ()
  let output_path = join(split(expand('%:p'), '\.')[:-2], '.') . '.pdf'
  execute '!zathura "' .output_path . '"'
endfunction

let R_args = ['--quiet']

" " " " " " " " " " " " " " " " " "
" Linters and Syntax Highlighters "
" " " " " " " " " " " " " " " " " "

let g:rainbow_active = 1

let g:pandoc#modules#disabled = ["folding", "spell"]
" let g:pandoc#syntax#conceal#use = 0

let g:tq_mthesaur_file="~/.config/nvim/mthesaur.txt"
let g:tq_enabled_backends=["mthesaur_txt"]

let g:coc_filetype_map = { 'pandoc': 'markdown', 'vimwiki': 'markdown' }

let g:coc_global_extensions = ["coc-css", "coc-db", "coc-diagnostic", "coc-docker", "coc-fish", "coc-flutter", "coc-git", "coc-gitignore", "coc-homeassistant", "coc-html", "coc-java", "coc-json", "coc-markdownlint", "coc-marketplace", "coc-pairs", "coc-prettier", "coc-pyright", "coc-rls", "coc-r-lsp", "coc-sh", "coc-spell-checker", "coc-svelte", "coc-texlab", "coc-toml", "coc-tslint", "coc-tsserver", "coc-webpack", "coc-vimlsp",  "coc-vimtex", "coc-xml", "coc-yaml"]

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
map f <Plug>(easymotion-bd-w)
noremap cf :CocFix<CR>
nmap cF <Plug>(coc-codeaction)
noremap cm :call CocAction('format')<CR>
noremap cn :call CocAction('diagnosticNext')<CR>
noremap cN :call CocAction('diagnosticPrevious')<CR>

noremap ch :noh<CR>
noremap ct :TableModeToggle<CR>

noremap cpl :LLPStartPreview<CR>
nmap cpm <Plug>MarkdownPreviewToggle
noremap cpp :silent write <bar> call PandocPreview()<CR>
noremap cpP :silent write <bar> call PandocPreview() <bar> silent call ZathuraCurrent()<CR>
noremap cz :silent call ZathuraCurrent()<CR>
noremap cpw :silent !wal -R<CR>

noremap cP :call mdip#MarkdownClipboardImage()<CR>

let g:vimwiki_key_mappings = { 'all_maps': 0 }
noremap cI :VimwikiIndex<CR>

let R_assign = 0

autocmd FileType markdown,vimwiki
      \ noremap c<CR> :VimwikiFollowLink<CR>|
      \ noremap c<BS> :VimwikiGoBackLink<CR>|
      \ noremap c<Space> :VimwikiToggleListItem<CR>|
      \ inoremap <CR> <ESC>:VimwikiReturn 3 5<CR>|
      \ noremap o A<ESC>:VimwikiReturn 3 5<CR>|
      \ noremap O kA<ESC>:VimwikiReturn 3 5<CR>|
      \ inoremap <TAB> <ESC>:VimwikiListChangeLvl increase 1<CR>a|
      \ inoremap <S-TAB> <ESC>:VimwikiListChangeLvl decrease 1<CR>a|
      \ noremap <TAB> <ESC>:VimwikiListChangeLvl increase 1<CR>|
      \ noremap <S-TAB> <ESC>:VimwikiListChangeLvl decrease 1<CR>|
      \ autocmd CompleteChanged * silent! iunmap <CR>|
      \ autocmd CompleteDone * inoremap <CR> <ESC>:VimwikiReturn 3 5<CR>|
      \ imap <C-B> **
      " \ imap <C-B> **|
      " \ imap <C-I> *|
      " \ imap <C-E> $

autocmd BufNewFile,BufRead *.pmd noremap cpy :write<BAR>!pweave %<CR>

noremap gCC :silent write <bar> :!gcc % && ./a.out<CR>

" " " " " " " " " " " " " " " "
" FileType Dependent Settings "
" " " " " " " " " " " " " " " "

autocmd FileType tex let b:coc_pairs_disabled = ['<']
autocmd FileType pandoc let b:coc_pairs_disabled = ['<']
autocmd FileType pandoc let g:table_mode_corner='|'
autocmd FileType markdown,rmd,vimwiki,tex let b:coc_pairs = [["$", "$"]]

" autocmd FileType pandoc set colorcolumn=81
" autocmd FileType pandoc set tw=80
" autocmd FileType pandoc set formatoptions+=t
autocmd FileType python set colorcolumn=101

" autocmd FileType pandoc set tabstop=3
" autocmd FileType pandoc set shiftwidth=3
" autocmd FileType pandoc set softtabstop=3

" Enables true color and colorizer
set termguicolors
lua require'colorizer'.setup()

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
    " colorscheme gupywal
    colorscheme tgc_wal
endif

let g:lightline = {
      \ 'active': {
      \   'right': [['cocstatus'], ['lineinfo'], ['filetype']]
      \ },
      \ 'separator' : { 'left': '', 'right': '' },
      \ 'subseparator' : { 'left': '', 'right': '' },
      \ 'colorscheme': 'pywal',
      \ 'component_function': { 'cocstatus': 'coc#status' }
      \ }
hi clear Conceal
let g:pandoc#syntax#conceal#blacklist = ["atx", "codeblock_start", "codeblock_delim"]
let R_openpdf = 0
let g:taskwiki_disable_concealcursor = 1
let g:taskwiki_suppress_mappings = 1

" hi EasyMotionTarget ctermbg=none ctermfg=green
" hi EasyMotionShade  ctermbg=none ctermfg=blue

" hi EasyMotionTarget2First ctermbg=none ctermfg=red
" hi EasyMotionTarget2Second ctermbg=none ctermfg=lightred

" hi EasyMotionMoveHL ctermbg=green ctermfg=black
" hi EasyMotionIncSearch ctermbg=green ctermfg=black
