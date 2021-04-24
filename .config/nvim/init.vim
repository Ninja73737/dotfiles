" " " " " " " " " " " "
" General Vim Settings"
" " " " " " " " " " " "
set concealcursor=

set wildmode=longest,list,full
set shortmess+=c

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

set expandtab
set smarttab
set autoindent

filetype plugin indent on

set ignorecase
set smartcase

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

let g:polyglot_disabled = ['autoindent']

set nocompatible

" " " " " "
" Plugins "
" " " " " "

call plug#begin()

" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install && rm ~/.config/nvim/plugged/markdown-preview.nvim/app/_static/favicon.ico'  }
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'mtoohey31/tgc_wal.vim'
Plug 'vim-pandoc/vim-pandoc', { 'for': 'tex' }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'tex' }
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
Plug 'mtoohey31/vim-refocus'
Plug 'reedes/vim-pencil'
Plug 'tools-life/taskwiki'
Plug 'ActivityWatch/aw-watcher-vim'
Plug 'luochen1990/rainbow'
Plug 'thaerkh/vim-indentguides'
Plug 'dkarter/bullets.vim'

call plug#end()

" " " " " " "
" Previewers"
" " " " " " "

let g:mdip_imgdir = expand('%:t:r')
let g:mdip_imgdir_intext = escape(expand('%:t:r'), ' ')

let g:mkdp_markdown_css = '/' . join(split($MYVIMRC, '/')[:-2], '/') . '/markdown-preview.css'
let g:mkdp_highlight_css = $HOME . '/.cache/wal/colors.css'
let g:mkdp_page_title = '${name}.md'
let g:mkdp_filetypes = ['markdown', 'pandoc', 'pmd', 'rmd']
let g:mkdp_command_for_global = 1

let g:vimwiki_conceallevel = 0
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
" let g:vimwiki_filetypes = ['markdown']
autocmd FileType vimwiki.markdown setlocal commentstring=<!--%s-->

let g:pencil#wrapModeDefault = 'soft'
autocmd BufNewFile,BufRead *.tex call pencil#init()
autocmd BufNewFile,BufRead *.Rmd set filetype=rmd
" autocmd BufNewFile,BufRead *.md set filetype=vimwiki.markdown

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
endfunction

function! ZathuraCurrent ()
  call system('zth "' . expand('%:p:r') . '.pdf"')
endfunction

let R_args = ['--quiet']

" " " " " " " " " " " " " " " " " "
" Linters and Syntax Highlighters "
" " " " " " " " " " " " " " " " " "

let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_strikethrough = 1
set conceallevel=2

let g:rainbow_active = 1

source ~/.cache/wal/colors-wal.vim

" Incorrect order is intentional, 7 is foreground
let g:rainbow_conf = {
      \ 'guifgs': [color7, color1, color2, color3, color4, color5, color6, color8, color7, color1, color2, color3, color4, color5, color6, color8, color7, color1, color2, color3, color4, color5, color6, color8, color7, color1, color2, color3, color4, color5, color6, color8],
      \ 'ctermfgs': [7, 1, 2, 3, 4, 5, 6, 8, 7, 1, 2, 3, 4, 5, 6, 8, 7, 1, 2, 3, 4, 5, 6, 8, 7, 1, 2, 3, 4, 5, 6, 8],
      \ 'guis': [''],
      \ 'cterms': [''],
      \ 'operators': '_,_',
      \ 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
      \ 'separately': {
      \   '*': {},
      \   'markdown': {
      \     'parentheses_options': 'containedin=markdownCode contained',
      \   },
      \   'haskell': {
      \     'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold']
      \   },
      \   'vim': {
      \     'parentheses_options': 'containedin=vimFuncBody',
      \   },
      \   'perl': {
      \     'syn_name_prefix': 'perlBlockFoldRainbow',
      \   },
      \   'css': 0,
      \ }
      \ }

let g:pandoc#modules#disabled = ["folding", "spell"]

let g:tq_mthesaur_file="~/.config/nvim/mthesaur.txt"
let g:tq_enabled_backends=["mthesaur_txt"]

let g:coc_filetype_map = { 'vimwiki.markdown': 'markdown' }

" For coc-r-lsp: install.packages("languageserver")
let g:coc_global_extensions = ["coc-css", "coc-db", "coc-diagnostic", "coc-dictionary", "coc-docker", "coc-fish", "coc-flutter", "coc-git", "coc-gitignore", "coc-homeassistant", "coc-html", "coc-java", "coc-json", "coc-markdownlint", "coc-marketplace", "coc-pairs", "coc-prettier", "coc-pyright", "coc-rls", "coc-r-lsp", "coc-sh", "coc-spell-checker", "coc-svelte", "coc-texlab", "coc-toml", "coc-tslint", "coc-tsserver", "coc-webpack", "coc-word", "coc-vimlsp",  "coc-xml", "coc-yaml"]

" " " " " " " " " " " " " " " 
" Navigation and Remappings "
" " " " " " " " " " " " " " "

let g:EasyMotion_smartcase = 1

noremap Q :quit!<CR>
noremap W :write<CR>
noremap Z :wq<CR>
noremap E :edit 

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
noremap cpl :CocCommand latex.Build<CR>
" TODO: Implement universal preview function
call timer_start(0, 'PreviewMap')
function! PreviewMap (timer)
  if &filetype == "tex"
    noremap cz :VimRefocusOneShot<CR>:CocCommand latex.ForwardSearch<CR>
  else
    noremap cz :silent call ZathuraCurrent()<CR>
  endif
  set concealcursor=""
endfunction
nmap cpm <Plug>MarkdownPreviewToggle
noremap cpp :silent write <bar> call PandocPreview()<CR>
noremap cpP :silent write <bar> call PandocPreview() <bar> silent call ZathuraCurrent()<CR>
noremap cpw :silent !wal -R<CR>

noremap cP :call mdip#MarkdownClipboardImage()<CR>

let g:vimwiki_key_mappings = { 'all_maps': 0 }
noremap cI :VimwikiIndex<CR>

let R_assign = 0

autocmd FileType markdown,vimwiki
      \ noremap c<CR> :VimwikiFollowLink<CR>|
      \ noremap c<BS> :VimwikiGoBackLink<CR>|
      \ noremap c<Space> :VimwikiToggleListItem<CR>|
      " \ inoremap <CR> <ESC>:VimwikiReturn 3 5<CR>|
      " \ noremap o A<ESC>:VimwikiReturn 3 5<CR>|
      " \ noremap O kA<ESC>:VimwikiReturn 3 5<CR>|
      \ inoremap <TAB> <ESC>:VimwikiListChangeLvl increase 1<CR>a|
      \ inoremap <S-TAB> <ESC>:VimwikiListChangeLvl decrease 1<CR>a|
      \ noremap <TAB> <ESC>:VimwikiListChangeLvl increase 1<CR>|
      \ noremap <S-TAB> <ESC>:VimwikiListChangeLvl decrease 1<CR>|
      " \ autocmd CompleteChanged * silent! iunmap <CR>|
      " \ autocmd CompleteDone * inoremap <CR> <ESC>:VimwikiReturn 3 5<CR>|
      \ imap <C-B> **

" " " " " " " " " " " " " " " "
" FileType Dependent Settings "
" " " " " " " " " " " " " " " "

autocmd FileType tex let b:coc_pairs_disabled = ['<']
autocmd FileType pandoc let b:coc_pairs_disabled = ['<']
autocmd FileType pandoc let g:table_mode_corner='|'
autocmd FileType markdown,rmd,vimwiki,tex let b:coc_pairs = [["$", "$"]]

autocmd FileType python set colorcolumn=81

" Enables true color and colorizer
if empty($SSH_CONNECTION)
  execute "hi Normal ctermbg=NONE guifg=" . color7 ." ctermfg=7"
  set termguicolors
  lua << EOF
if jit ~= nil then
    require'colorizer'.setup()
end
EOF
endif

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
    colorscheme tgc_wal
endif

let g:lightline = {
      \ 'active': {
      \   'right': [['cocstatus'], ['percent', 'lineinfo'], ['filetype']]
      \ },
      \ 'inactive': {
      \   'left': [[], ['filename']],
      \   'right': [[], ['percent', 'lineinfo'], ['filetype']]
      \ },
      \ 'separator' : { 'left': '', 'right': '' },
      \ 'subseparator' : { 'left': '', 'right': '' },
      \ 'colorscheme': 'pywal',
      \ 'component_function': { 'cocstatus': 'coc#status', 'wc': 'WordCount'}
      \ }

autocmd FileType vimwiki,pandoc,rmd if (index(g:lightline['active']['right'][1], 'wc') == -1)|call add(g:lightline['active']['right'][1], 'wc')|endif

hi clear Conceal
let g:pandoc#syntax#conceal#blacklist = ["atx", "codeblock_start", "codeblock_delim"]
let R_openpdf = 0
let g:taskwiki_disable_concealcursor = 1
let g:taskwiki_suppress_mappings = 1

function! WordCount()
  " if filereadable(expand('%:p:r') . '.pdf')
  "   return substitute(system('pdftotext "' . expand('%:p:r') . '.pdf" - | wc -w'), '\n', '', '') . ' W'
  " else
    let s:old_status = v:statusmsg
    let position = getpos(".")
    exe ":silent normal g\<c-g>"
    let stat = v:statusmsg
    let s:word_count = 0
    if stat != '--No lines in buffer--'
      if stat =~ "^Selected"
        let s:word_count = str2nr(split(v:statusmsg)[5])
      else
        let s:word_count = str2nr(split(v:statusmsg)[11])
      end
      let v:statusmsg = s:old_status
    end
    call setpos('.', position)
    return s:word_count . ' W'
  " endif
endfunction

let g:vim_refocus_kill_flashfocus = 1
