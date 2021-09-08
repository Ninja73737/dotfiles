set shortmess+=c
if empty($SSH_CONNECTION)
  set pumblend=20
endif
set guifont=JetBrainsMono\ Nerd\ Font:h14
set pumheight=15
set completeopt=menuone,noinsert,noselect
set number relativenumber
set mouse=a
set scrolloff=7
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
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
set termguicolors
"" Restore cursor position
au BufReadPost *
         \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
         \ |   exe "normal! g`\""
         \ | endif
let g:polyglot_disabled = ['autoindent']

call plug#begin()

Plug 'sheerun/vim-polyglot'

let g:polyglot_disabled = ['markdown', 'svelte', 'ansible']

Plug 'leafOfTree/vim-svelte-plugin'

let g:vim_svelte_plugin_use_typescript = 1

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

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
autocmd User EasyMotionPromptBegin silent! LspStop
autocmd User EasyMotionPromptEnd silent! LspStart
map f <Plug>(easymotion-bd-w)

Plug 'ron89/thesaurus_query.vim'

let g:tq_mthesaur_file="~/.config/nvim/mthesaur.txt"
let g:tq_enabled_backends=["mthesaur_txt"]

Plug 'chaoren/vim-wordmotion'
Plug 'vim-scripts/loremipsum'
Plug 'shadmansaleh/lualine.nvim' " TODO: change back to hoob3rt/ when he resumes maintenance
Plug 'ferrine/md-img-paste.vim'

let g:mdip_imgdir = expand('%:t:r')
let g:mdip_imgdir_intext = escape(expand('%:t:r'), ' ')
let g:mkdp_markdown_css = '/' . join(split($MYVIMRC, '/')[:-2], '/') . '/markdown-preview.css'
noremap cP :call mdip#MarkdownClipboardImage()<CR>

Plug 'mtoohey31/doctest.nvim', {'do': ':UpdateRemotePlugins'}
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
let _himalaya_path = system("which himalaya")
if v:shell_error == 0
  Plug 'soywod/himalaya', {'rtp': 'vim'}

  autocmd BufEnter /tmp/himalaya-draft.mail set ft=mail
endif
Plug 'kmonad/kmonad-vim'
Plug 'othree/eregex.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'cbarrete/completion-vcard'
Plug 'mtoohey31/completion-fish'

autocmd BufEnter * lua require'completion'.on_attach()
let g:completion_chain_complete_list = {
                  \ 'default': [{ 'complete_items': ['lsp',  'path']}],
                  \ 'fish': [{ 'complete_items': ['fish', 'lsp', 'path']}],
                  \ 'mail': [{ 'complete_items': ['vCard']}]
                  \ }
let g:completion_matching_strategy_list = ["exact", "substring", "fuzzy"]

call plug#end()

colorscheme tgc_wal

lua << EOF
require'lualine'.setup({ options = { theme = 'pywal' }, sections = { lualine_x = { 'filetype' }}})
require'colorizer'.setup()

local nvim_lsp = require('lspconfig')
local nvim_completion = require('completion')
nvim_completion.addCompletionSource('fish', require'completion-fish'.complete_item)
require'completion_vcard'.setup_completion('~/.contacts/32')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<Leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<Leader>f', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<Leader>F', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('n', '<Leader>N', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<Leader>n', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

  vim.opt.updatetime = 0
  vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})]]
  vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)]]

  nvim_completion.on_attach(client, bufnr)
end

local servers = { "ansiblels", "bashls", "ccls", "cssls", "dartls", "dockerls", "gopls", "html", "java_language_server", "pyright", "r_language_server", "rls", "svelte", "texlab", "tsserver", "vimls", "yamlls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
nvim_lsp.zeta_note.setup{ cmd = { '/home/mtoohey/.cargo/bin/zeta-note' }, on_attach = on_attach, flags = { debounce_text_changes = 150 } }

local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = '/usr/bin/lua-language-server'

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

nvim_lsp.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", "/usr/share/lua-language-server/main.lua"};
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = '/usr/bin/luajit',
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      }
    }
  },
  on_attach = on_attach
}
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

noremap $ g_
noremap! <C-BS> <C-w>
" Necessary for the backspace remap above for some reason...
noremap! <C-h> <C-w>
noremap <ESC> <CMD>noh<CR>
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
autocmd FileType lua set colorcolumn=120

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
inoremap <CR> <CR><C-g>u

" TODO: Figure out horizontal shifting with similar commands
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv

nnoremap p "+p
nnoremap P "+P
vnoremap p "+p
vnoremap P "+P

nnoremap y "+y
nnoremap Y "+Y
vnoremap y "+y
vnoremap Y "+Y

nnoremap d "+d
nnoremap D "+D
vnoremap d "+d
vnoremap D "+D
vnoremap x "+x


