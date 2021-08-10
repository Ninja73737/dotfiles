set shortmess+=c
if empty($SSH_CONNECTION)
  set pumblend=20
endif
set guifont=JetBrainsMono\ Nerd\ Font:h14
set pumheight=15
set number relativenumber
set mouse=a
set scrolloff=7
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
set clipboard=unnamedplus
set notimeout
set expandtab
set smarttab
set autoindent
filetype plugin indent on
set ignorecase
set smartcase
syntax on
set noshowmode
set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾
set nocompatible
"" Restore cursor position
au BufReadPost *
         \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
         \ |   exe "normal! g`\""
         \ | endif
let g:polyglot_disabled = ['autoindent']

call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" For coc-r-lsp: install.packages("languageserver")
let g:coc_global_extensions = ["coc-css", "coc-db", "coc-diagnostic", "coc-dictionary", "coc-docker", "coc-fish", "coc-flutter", "coc-git", "coc-gitignore", "coc-go", "coc-homeassistant", "coc-html", "coc-java", "coc-json", "coc-kotlin", "coc-markdownlint", "coc-marketplace", "coc-pairs", "coc-prettier", "coc-pyright", "coc-rls", "coc-r-lsp", "coc-sh", "coc-spell-checker", "coc-svelte", "coc-texlab", "coc-toml", "coc-tslint", "coc-tsserver", "coc-webpack", "coc-word", "coc-vimlsp",  "coc-xml", "coc-yaml"]
autocmd FileType markdown,rmd,tex let b:coc_pairs_disabled = ['<']
autocmd FileType markdown,rmd,tex let b:coc_pairs = [["$", "$"]]
noremap cf :CocFix<CR>
nmap cF <Plug>(coc-codeaction)
noremap cm <CMD>call CocAction('format')<CR>
noremap cn <CMD>call CocAction('diagnosticNext')<CR>
noremap cN <CMD>call CocAction('diagnosticPrevious')<CR>
noremap cv <CMD>call CocActionAsync('doHover')<CR>
noremap cR <CMD>call CocActionAsync('rename')<CR>
noremap gD <CMD>call CocActionAsync('jumpDefinition')<CR>
noremap gr <CMD>call CocActionAsync('jumpReferences')<CR>
noremap cpl :CocCommand latex.Build<CR>

Plug 'sheerun/vim-polyglot'

let g:polyglot_disabled = ['markdown', 'svelte']

Plug 'leafOfTree/vim-svelte-plugin'

let g:vim_svelte_plugin_use_typescript = 1

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

let g:mkdp_highlight_css = $HOME . '/.cache/wal/colors.css'
let g:mkdp_page_title = '${name}.md'
let g:mkdp_filetypes = ['markdown', 'pandoc', 'pmd', 'rmd']
let g:mkdp_command_for_global = 1

Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'

autocmd FileType markdown setlocal commentstring=<!--%s-->

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'luochen1990/rainbow'

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

Plug 'vim-pandoc/vim-pandoc', { 'for': 'tex' }
Plug 'vim-pandoc/vim-pandoc-syntax'

autocmd FileType markdown set syntax=markdown.pandoc
let g:pandoc#syntax#conceal#blacklist = ["atx", "codeblock_start", "codeblock_delim", "quotes"]
let g:pandoc#modules#disabled = ["folding", "spell"]

Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}

autocmd BufNewFile,BufRead *.Rmd set filetype=rmd
let R_args = ['--quiet']
let R_assign = 0
let R_openpdf = 0
let R_auto_start = 1

Plug 'mbbill/undotree'

if has("persistent_undo")
   let target_path = expand('~/.local/share/nvim/undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif

Plug 'easymotion/vim-easymotion'

let g:EasyMotion_smartcase = 1
autocmd User EasyMotionPromptBegin silent! CocDisable
autocmd User EasyMotionPromptEnd silent! CocEnable
map f <Plug>(easymotion-bd-w)

Plug 'ron89/thesaurus_query.vim'

let g:tq_mthesaur_file="~/.config/nvim/mthesaur.txt"
let g:tq_enabled_backends=["mthesaur_txt"]

Plug 'chaoren/vim-wordmotion'
Plug 'vim-scripts/loremipsum'
Plug 'itchyny/lightline.vim'

function! LineInfo()
  return col('.') . 'x' . line('.')
endfunction
let g:lightline = {
      \ 'active': {
      \   'right': [['cocstatus'], ['percent', 'custom_lineinfo'], ['filetype']]
      \ },
      \ 'inactive': {
      \   'left': [[], ['filename']],
      \   'right': [[], ['percent', 'lineinfo'], ['filetype']]
      \ },
      \ 'separator' : { 'left': '', 'right': '' },
      \ 'subseparator' : { 'left': '', 'right': '' },
      \ 'component_function': { 'cocstatus': 'coc#status', 'wc': 'WordCount', 'custom_lineinfo': 'LineInfo'}
      \ }
autocmd FileType markdown,rmd,tex if (index(g:lightline['active']['right'][1], 'wc') == -1)|call add(g:lightline['active']['right'][1], 'wc')|endif

if empty($SSH_CONNECTION)
  let g:lightline['colorscheme'] = 'pywal'
else
  let g:lightline['colorscheme'] = 'nord'
endif

Plug 'ferrine/md-img-paste.vim'

let g:mdip_imgdir = expand('%:t:r')
let g:mdip_imgdir_intext = escape(expand('%:t:r'), ' ')
let g:mkdp_markdown_css = '/' . join(split($MYVIMRC, '/')[:-2], '/') . '/markdown-preview.css'
noremap cP :call mdip#MarkdownClipboardImage()<CR>

Plug 'mtoohey31/doctest.nvim'
Plug 'mtoohey31/vim-refocus'

let g:vim_refocus_kill_flashfocus = 1

Plug 'kana/vim-skeleton'
Plug 'reedes/vim-pencil'

let g:pencil#conceallevel = 2
let g:pencil#wrapModeDefault = 'soft'
let g:pencil#cursorwrap = 0
autocmd FileType markdown,rmd,tex call pencil#init()

Plug 'dhruvasagar/vim-table-mode'

noremap ct <CMD>TableModeToggle<CR>

Plug 'dkarter/bullets.vim'

let g:bullets_outline_levels = ['ABC', 'num', 'std-']
let g:bullets_renumber_on_change = 0
nmap <Tab> >>
nmap <S-Tab> <<
imap <Tab> <C-t>
imap <S-Tab> <C-d>

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

let g:goyo_width = "85%"
noremap cg :Goyo<BAR>Limelight!!<CR>

Plug 'mg979/vim-visual-multi'

let g:VM_maps = {}
let g:VM_maps["Find Under"] = "<C-n>"
let g:VM_maps["Find Subword Under"] = "<C-n>"

Plug 'airblade/vim-gitgutter'
Plug 'mtoohey31/tgc_wal.vim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'itsvinayak/image.vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

noremap cr <CMD>Telescope live_grep<CR>

Plug 'mtoohey31/chafa.vim'
Plug 'soywod/himalaya', {'rtp': 'vim'}
Plug 'kmonad/kmonad-vim'

call plug#end()


colorscheme tgc_wal

execute "hi Normal ctermbg=NONE guifg=" . color7 ." ctermfg=7"
set termguicolors
lua << EOF
if jit ~= nil then
    require'colorizer'.setup()
end
EOF

autocmd BufWinEnter,WinEnter term://* startinsert
autocmd TermOpen * set nonumber norelativenumber
tnoremap <ESC> <C-\><C-n>
tnoremap <C-w> <C-\><C-n><C-w>

function! PandocPreview ()
  let output_path = expand('%:p:r') . '.pdf'
  execute '!pandoc --metadata-file $HOME/.config/pandoc/default-metadata.yaml -f markdown "' . expand('%:p') . '" -t pdf --pdf-engine=xelatex -o "' . output_path . '"'
endfunction

function! ZathuraCurrent ()
  call system('zth "' . expand('%:p:r') . '.pdf"')
endfunction

noremap Q <CMD>quit!<CR>
noremap W <CMD>write<CR>
noremap Z <CMD>wq<CR>
noremap E :edit 

noremap! <C-BS> <C-w>
" Necessary for the backspace remap above for some reason...
noremap! <C-h> <C-w>
noremap ch <CMD>noh<CR>
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

autocmd FileType python set colorcolumn=80

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

noremap cH :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

nnoremap n nzzzv
nnoremap N Nzzzv

inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
inoremap " "<C-g>u
inoremap ' '<C-g>u
inoremap ( (<C-g>u
inoremap [ [<C-g>u
inoremap { {<C-g>u
inoremap } }<C-g>u
inoremap ] ]<C-g>u
inoremap ) )<C-g>u

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv
