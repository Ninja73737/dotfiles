" TODO: fix markdown setup
" TODO: Switch to `init.lua`
" TODO: Fix backspace remapping
" TODO: Get dictionary lookup with K for words when lsp hover isn't available
" TODO: Add noa writes to compile and execute commands
" global mappings {{{
nmap Q <CMD>quit!<CR>
nmap W <CMD>noa write<CR>
nmap Z <CMD>wq<CR>

nmap $ g_
vmap $ g_

nmap <Leader>h <CMD>noh<CR>
nmap <Leader>Dm <CMD>redir @" \| silent map \| redir END \| new \| put!<CR>
nmap <Leader>Dh <CMD>echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

nmap <Leader>qo <CMD>copen<CR>
nmap <Leader>qc <CMD>cclose<CR>

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

vmap J :m '>+1<CR>gv=gv
vmap K :m '>-2<CR>gv=gv

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

imap <F1> <NUL>
imap <F2> <NUL>
imap <F3> <NUL>
imap <F4> <NUL>
imap <F5> <NUL>
imap <F6> <NUL>
imap <F7> <NUL>
imap <F8> <NUL>
imap <F9> <NUL>
imap <F10> <NUL>
imap <F11> <NUL>
imap <F12> <NUL>

omap <silent> i* :<C-U>normal! T*vt*<CR>
vmap <silent> i* :<C-U>normal! T*vt*<CR>
omap <silent> a* :<C-U>normal! F*vf*<CR>
vmap <silent> a* :<C-U>normal! F*vf*<CR>

omap <silent> i$ :<C-U>normal! T$vt$<CR>
vmap <silent> i$ :<C-U>normal! T$vt$<CR>
omap <silent> a$ :<C-U>normal! F$vf$<CR>
vmap <silent> a$ :<C-U>normal! F$vf$<CR>

tnoremap <C-w> <C-\><C-n><C-w>
" }}}
" local mappings {{{
let g:maplocalleader = '\\'

autocmd FileType java nmap <buffer> <LocalLeader><CR> <CMD>!java %<CR>
autocmd FileType markdown nmap <buffer> <LocalLeader>z <CMD>call system('zth "' . expand('%:p:r') . '.pdf"')<CR>
autocmd FileType markdown nmap <buffer> <LocalLeader>h <Plug>MarkdownPreviewToggle
autocmd FileType markdown nmap <buffer> <LocalLeader>p <CMD>call system('pandoc --metadata-file $HOME/.config/pandoc/default-metadata.yaml -f markdown "' . expand('%:p') . '" -t pdf --pdf-engine=xelatex -o "' . expand('%:p:r') . '.pdf" &')<CR>
autocmd FileType markdown nmap <buffer> <LocalLeader>P <CMD>execute('!pandoc --metadata-file $HOME/.config/pandoc/default-metadata.yaml -f markdown "' . expand('%:p') . '" -t pdf --pdf-engine=xelatex -o "' . expand('%:p:r') . '.pdf"')<CR>
autocmd FileType markdown nmap <buffer> <LocalLeader>i <CMD>call mdip#MarkdownClipboardImage()<CR>
nmap <LocalLeader>t <CMD>lua require('truth_table')(vim.fn.input("separator: "))<CR>
autocmd FileType markdown nmap <buffer> <LocalLeader>t <CMD>lua require('truth_table')(" | ")<CR>
autocmd FileType python nmap <buffer> <LocalLeader><CR> <CMD>!python3 %<CR>
autocmd FileType tex nmap <buffer> <LocalLeader><CR> <CMD>!mkdir -p /tmp/pdflatex && pdflatex -output-directory /tmp/pdflatex % && cp /tmp/pdflatex/*.pdf (dirname %)<CR>

function! RUserMaps()
      nmap <buffer> <LocalLeader>kp <Plug>RMakePDFK
      nmap <buffer> <LocalLeader>kh <Plug>RMakeHTML
      nmap <buffer> <LocalLeader>h <Plug>RSendChunkFH
      nmap <buffer> <LocalLeader>c <Plug>RESendChunk
      nmap <buffer> <LocalLeader>o <Plug>ROpenLists
      nmap <buffer> <LocalLeader>n <Plug>RNextRChunk
      nmap <buffer> <LocalLeader>N <Plug>RPreviousRChunk
endfunction
autocmd FileType rmd call RUserMaps()
" }}}
" settings {{{
set foldmethod=marker
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
au BufReadPost * silent
         \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
         \ |   exe "normal! g`\"zv"
         \ | endif
autocmd FileType * let b:AutoPairs = AutoPairsDefine({'\v(^|\W)\zs''':"'"})
" }}}
" local settings {{{
autocmd FileType java let b:no_auto_format=1
autocmd FileType java set shiftwidth=4
autocmd FileType markdown set softtabstop=2
autocmd FileType java set softtabstop=4
autocmd FileType python set colorcolumn=80
autocmd FileType lua set colorcolumn=120
autocmd FileType lua let b:AutoPairs = AutoPairsDefine({'\v(^|.)\zs''':"'"}, ['\v(^|\W)\zs'''])
autocmd FileType vim let b:AutoPairs = AutoPairsDefine({'<':'>'})
" TODO: Make mamrkdown `*` and `_` pairs only work outside math
autocmd FileType markdown let g:AutoPairs = AutoPairsDefine({'*':'*', '**':'**', '_':'_','$':'$', '$$':'$$', "<!--":'-->'})
autocmd FileType rust let b:AutoPairs = AutoPairsDefine({'\w\zs<': '>'})
" }}}
" plugins {{{
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
let g:mkdp_preview_options = {
                  \ 'katex': {
                        \ 'macros': {
                              \ '\st': '\text{ s.t. }'
                        \ }
                  \ },
                  \ 'sync_scroll_type': 'middle',
                  \ 'hide_yaml_meta': 1,
                  \ 'disable_filename': 1
                  \ }
let g:mkdp_markdown_css = '/' . join(split($MYVIMRC, '/')[:-2], '/') . '/markdown-preview.css'

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

" autocmd FileType markdown set syntax=markdown.pandoc
let g:pandoc#syntax#conceal#blacklist = ["atx", "codeblock_start", "codeblock_delim", "quotes"]
let g:pandoc#modules#disabled = ["folding", "spell"]

Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}

autocmd BufNewFile,BufRead *.Rmd set filetype=rmd
let R_auto_start = 1
let R_esc_term = 0
let R_close_term = 1
let R_args = ['--no-save', '--quiet']
let R_assign = 0
let R_openpdf = 1
let R_openhtml = 0
let R_user_maps_only = 1

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

let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
autocmd User EasyMotionPromptBegin silent! LspStop
autocmd User EasyMotionPromptEnd silent! LspStart
map f <Plug>(easymotion-bd-w)
Plug 'chaoren/vim-wordmotion'
Plug 'vim-scripts/loremipsum'
Plug 'shadmansaleh/lualine.nvim' " TODO: change back to hoob3rt/ when he resumes maintenance
Plug 'ferrine/md-img-paste.vim'

let g:mdip_imgdir = expand('%:t:r')
let g:mdip_imgdir_intext = escape(expand('%:t:r'), ' ')

Plug 'mtoohey31/doctest.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'mtoohey31/truth-table.nvim',
Plug 'reedes/vim-pencil'

let g:pencil#conceallevel = 2
let g:pencil#wrapModeDefault = 'soft'
let g:pencil#cursorwrap = 0
autocmd FileType markdown,rmd,tex call pencil#init()

Plug 'dkarter/bullets.vim'

let g:bullets_set_mappings = 0
let g:bullets_outline_levels = ['ABC', 'num', 'std-']
let g:bullets_checkbox_markers = ' ox'
let g:bullets_renumber_on_change = 0


autocmd FileType markdown nmap <LocalLeader><Space> <CMD>ToggleCheckbox<CR>
autocmd FileType markdown noremap o <CMD>InsertNewBullet<CR>
let g:completion_confirm_key = ""
inoremap <expr> <CR> pumvisible() ? complete_info()["selected"] != "-1" ? "\<Plug>(completion_confirm_completion)" : "\<C-e>\<CR>" : "\<CR>"
autocmd FileType markdown inoremap <expr> <CR> pumvisible() ? complete_info()["selected"] != "-1" ? "\<Plug>(completion_confirm_completion)" : "\<C-e>\<CMD>InsertNewBullet<CR>" : "\<CMD>InsertNewBullet<CR>"

Plug 'junegunn/goyo.vim'

let g:goyo_width = "85%"
nmap <Leader>G <CMD>Goyo<CR>

Plug 'mg979/vim-visual-multi'
Plug 'airblade/vim-gitgutter'

let g:gitgutter_map_keys = 0
nmap <Leader>gn <Plug>(GitGutterNextHunk)
nmap <Leader>gN <Plug>(GitGutterPrevHunk)

Plug 'mtoohey31/tgc_wal.vim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

nmap <Leader>t <CMD>Telescope live_grep<CR>

Plug 'mtoohey31/chafa.vim'

let _himalaya_path = system("which himalaya")
if v:shell_error == 0
  Plug 'soywod/himalaya', {'rtp': 'vim'}

  autocmd BufEnter /tmp/himalaya-draft.mail set ft=mail
endif

Plug 'othree/eregex.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'SirVer/ultisnips'

let g:completion_enable_snippet = 'UltiSnips'
let g:UltiSnipsExpandTrigger="<NUL>"
let g:UltiSnipsJumpForwardTrigger="<NUL>"
let g:UltiSnipsJumpBackwardTrigger="<NUL>"
autocmd FileType markdown let g:completion_trigger_character = ['`', "#"]
inoremap <expr> <Tab> pumvisible() ? "\<Down>" : "\<CMD>call JumpForwardsOrIndent()<CR>"
inoremap <expr> <S-Tab> pumvisible() ? "\<Up>" : "\<CMD>call JumpBackwardsOrIndent()<CR>"
noremap <Tab> >>
noremap <S-Tab> <<

function! JumpForwardsOrIndent()
      call UltiSnips#JumpForwards()
      if !g:ulti_jump_forwards_res
        call feedkeys("\<C-t>")
      endif
endfunction

function! JumpBackwardsOrIndent()
      call UltiSnips#JumpBackwards()
      if !g:ulti_jump_backwards_res
        call feedkeys("\<C-d>")
      endif
endfunction

Plug 'honza/vim-snippets'
Plug 'cbarrete/completion-vcard'
Plug 'mtoohey31/completion-fish'

autocmd BufEnter * lua require'completion'.on_attach()
let g:completion_chain_complete_list = {
                  \ 'default': [{ 'complete_items': ['UltiSnips', 'lsp']}],
                  \ 'markdown': [{ 'complete_items': ['UltiSnips', 'cSpell', 'lsp', 'path']}],
                  \ 'fish': [{ 'complete_items': ['UltiSnips', 'fish', 'lsp', 'path']}],
                  \ 'vim': [{ 'complete_items': ['UltiSnips', 'lsp', 'path']}],
                  \ 'sh': [{ 'complete_items': ['UltiSnips', 'lsp', 'path']}],
                  \ 'zsh': [{ 'complete_items': ['UltiSnips', 'lsp', 'path']}],
                  \ 'mail': [{ 'complete_items': ['vCard']}]
                  \ }
let g:completion_matching_strategy_list = ["exact", "substring", "fuzzy"]
let g:completion_sorting = "none"

call plug#end()
" }}}
" lua {{{
lua << EOF
require'lualine'.setup({ options = { theme = 'pywal' }, sections = { lualine_x = { 'filetype' } } })
-- require'cspell'.setup_completion('en_GB')
require'colorizer'.setup()

local nvim_lsp = require('lspconfig')
local nvim_completion = require('completion')
nvim_completion.addCompletionSource('fish', require'completion-fish'.complete_item)
require'completion_vcard'.setup_completion('~/.contacts/32')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  local opts = { noremap=false, silent=true }

  buf_set_keymap('n', 'gd', '<cmd>split | lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<Leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<Leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('n', '<Leader>F', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<Leader>N', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<Leader>n', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

  vim.opt.updatetime = 250
  vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})]]
  -- TODO: check if we're in a repository owned by someone else or a fork of a
  -- repository owned by someone else, and if we are, don't register this
  -- autocommand.
  vim.cmd [[autocmd BufWritePre * call FormatIfOk()]]

  nvim_completion.on_attach(client, bufnr)
end

local servers = { "ansiblels", "bashls", "ccls", "cssls", "dockerls", "gopls", "html", "jdtls", "jsonls", "pyright", "r_language_server", "rls", "svelte", "taplo", "texlab", "tsserver", "vimls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

nvim_lsp.diagnosticls.setup({
   on_attach = on_attach,
   filetypes={ "markdown", "rmd" },
   init_options = {
      formatters = {
         prettier = {
            command = "prettier",
            args = { "--stdin-filepath", "%filename" }
         }
      },
      linters = {
         markdownlint = {
            command = "markdownlint",
            isStderr = true,
            debounce = 100,
            args = { "-c", "/home/mtoohey/.config/nvim/markdownlint.yaml", "--stdin" },
            offsetLine = 0,
            offsetColumn = 0,
            sourceName = "markdownlint",
            formatLines = 1,
            formatPattern = {
               "^.*?:\\s?(\\d+)(:(\\d+)?)?\\s(MD\\d{3}\\/[A-Za-z0-9-/]+)\\s(.*)$",
               {
                  line = 1,
                  column = 3,
                  message = {4}
               }
            }
         },
         cspell = {
            command = "cspell",
            debounce = 100,
            args = { "--locale", "en-GB", "%filepath" },
            sourceName = "cspell",
            formatLines = 1,
            formatPattern = { ".*?:(\\d+):(\\d+)\\s*-\\s*(.*)", { line = 1, column = 2, message = 3 } }
         },
      },
      filetypes = { markdown = { "markdownlint", "cspell" }, rmd = { "markdownlint", "cspell"} },
      formatFiletypes = {
         markdown = "prettier",
         rmd = "prettier"
      }
   }
}
)

nvim_lsp.omnisharp.setup{
  cmd = { "/usr/bin/omnisharp", "--languageserver" , "--hostPID", tostring(vim.fn.getpid()) },
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}

local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = '/usr/bin/lua-language-server'

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

nvim_lsp.sumneko_lua.setup {
  cmd = { sumneko_binary, "-E", "/usr/share/lua-language-server/main.lua" };
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

local yamlls_settings = { yaml = { schemas = {} } }
yamlls_settings.yaml.schemas["/home/mtoohey/yams/schema.yaml"] = "recipes/**/*.yaml"

nvim_lsp.yamlls.setup {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  settings = yamlls_settings
}

local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = true,
})
EOF

function! FormatIfOk()
  if !exists("b:no_auto_format")
    lua vim.lsp.buf.formatting_seq_sync(nil, 1000)
  endif
endfunction
" }}}

colorscheme tgc_wal

autocmd BufWinEnter,WinEnter term://* startinsert
autocmd TermOpen * setlocal nonumber norelativenumber
