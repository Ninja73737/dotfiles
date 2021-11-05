" TODO: Switch to `init.lua`
" TODO: Make tree sitter indent adjusting plugin
" TODO: Get dictionary lookup with K for words when lsp hover isn't available
" TODO: Add noa writes to compile and execute commands
" TODO: Check out https://github.com/jose-elias-alvarez/null-ls.nvim for
" cspell fix spelling code actions, these can be implemented with an async
" code action that checks if the currently selected word is being detected by
" cspell by creating a tempfile file containg only that word (not by using the
" trace subcommand because that's slower) and displaying the option add it to
" the file's ignore or the global config maybe if the check's exit code is
" non-zero.

" global mappings {{{
nmap Q <CMD>quitall!<CR>
nmap W <CMD>noa write<CR>
nmap Z <CMD>wq<CR>

nmap $ g_
vmap $ g_

nmap <Leader>h <CMD>noh<CR>
nmap <Leader>Dm <CMD>redir @" \| silent map \| redir END \| new \| put!<CR>
nmap <Leader>DH <CMD>redir @" \| silent hi \| redir END \| new \| put!<CR>
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

inoremap <C-h> <C-g>u<ESC>vT s
inoremap <C-BS> <C-g>u<ESC>vT s
inoremap <C-z> <C-o>u

noremap <Tab> >>
noremap <S-Tab> <<

vmap <Tab> >
vmap <S-Tab> <

tnoremap <C-w> <C-\><C-n><C-w>
" }}}
" local mappings {{{
let g:maplocalleader = '\\'

autocmd FileType java nmap <buffer> <LocalLeader><CR> <CMD>!java %<CR>
autocmd FileType markdown,rmd,tex nmap <buffer> <LocalLeader>z <CMD>call system('zth "' . expand('%:p:r') . '.pdf"')<CR>
autocmd FileType markdown,rmd nmap <buffer> <LocalLeader>h <Plug>MarkdownPreviewToggle
autocmd FileType markdown nmap <buffer> <LocalLeader>p <CMD>call system('pandoc --metadata-file $HOME/.config/pandoc/default-metadata.yaml -f markdown "' . expand('%:p') . '" -t pdf --pdf-engine=xelatex -o "' . expand('%:p:r') . '.pdf" &')<CR>
autocmd FileType markdown nmap <buffer> <LocalLeader>P <CMD>execute('!pandoc --metadata-file $HOME/.config/pandoc/default-metadata.yaml -f markdown "' . expand('%:p') . '" -t pdf --pdf-engine=xelatex -o "' . expand('%:p:r') . '.pdf"')<CR>
autocmd FileType markdown,rmd nmap <buffer> <LocalLeader>i <CMD>call mdip#MarkdownClipboardImage()<CR>
nmap <LocalLeader>t <CMD>lua require('truth_table')(vim.fn.input("separator: "), vim.fn.input("left border: "), vim.fn.input("right border: "))<CR>
autocmd FileType text nmap <buffer> <LocalLeader>t <CMD>lua require('truth_table')(" ")<CR>
autocmd FileType markdown nmap <buffer> <LocalLeader>t <CMD>lua require('truth_table')(" <BAR> ", "<BAR> ", " <BAR>")<CR>
autocmd FileType python nmap <buffer> <LocalLeader><CR> <CMD>!python3 %<CR>
autocmd FileType tex nmap <buffer> <LocalLeader><CR> <CMD>noa w <BAR> TexlabBuild<CR>
autocmd FileType tex nmap <buffer> <LocalLeader>f <CMD>TexlabForward<CR>
" autocmd FileType tex nmap <buffer> <LocalLeader><CR> <CMD>noa w <BAR> call system('mkdir -p /tmp/pdflatex && pdflatex -output-directory /tmp/pdflatex '. expand('%:p') . ' && cp /tmp/pdflatex/*.pdf (dirname ' . expand('%:p') . ')')<CR>
" autocmd FileType tex nmap <buffer> <LocalLeader><S-CR> <CMD>noa w <BAR> !mkdir -p /tmp/pdflatex && pdflatex -output-directory /tmp/pdflatex % && cp /tmp/pdflatex/*.pdf (dirname %)<CR>

function! RUserMaps()
      nmap <buffer> <LocalLeader>kp <Plug>RMakePDFK
      nmap <buffer> <LocalLeader>kh <Plug>RMakeHTML
      nmap <buffer> <LocalLeader>h <Plug>RSendChunkFH
      nmap <buffer> <LocalLeader>c <Plug>RESendChunk
      nmap <buffer> <LocalLeader>o <Plug>ROpenLists
      nmap <buffer> <LocalLeader>n <Plug>RNextRChunk
      nmap <buffer> <LocalLeader>N <Plug>RPreviousRChunk
      nmap <buffer> <LocalLeader>l <Plug>RSendLine
endfunction
autocmd FileType rmd call RUserMaps()
autocmd FileType markdown inoremap <buffer> <S-CR> <CR><CR>---<CR><CR>
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
autocmd FileType java set shiftwidth=4
autocmd FileType markdown,rmd set softtabstop=1
autocmd FileType java set softtabstop=4
autocmd FileType python set colorcolumn=80
autocmd FileType lua set colorcolumn=120
autocmd FileType lua let b:AutoPairs = AutoPairsDefine({'\v(^|.)\zs''':"'"}, ['\v(^|\W)\zs'''])
autocmd FileType vim let b:AutoPairs = AutoPairsDefine({'<':'>'})
" TODO: Make mamrkdown `*` and `_` pairs only work outside math
" autocmd FileType markdown,rmd let g:AutoPairs = AutoPairsDefine({'*':'*', '**':'**', '_':'_', '$':'$', '$$':'$$', "<!--":'-->'})
autocmd FileType markdown,rmd let g:AutoPairs = AutoPairsDefine({'$':'$', '$$':'$$', "<!--":'-->'})
autocmd FileType tex let g:AutoPairs = AutoPairsDefine({'$':'$', '$$':'$$', '``':"''"}, ['`', "'"])
autocmd FileType rust let b:AutoPairs = AutoPairsDefine({'\w\zs<': '>'})
" }}}
" plugins {{{
let g:polyglot_disabled = ['autoindent']

call plug#begin()

Plug 'sheerun/vim-polyglot'

let g:polyglot_disabled = ['markdown', 'svelte', 'ansible', 'docker-compose']

Plug 'leafOfTree/vim-svelte-plugin'

let g:vim_svelte_plugin_use_typescript = 1

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'rmd', 'vim-plug']}

let g:mkdp_highlight_css = $HOME . '/.cache/wal/colors.css'
let g:mkdp_page_title = '${name}.md'
let g:mkdp_filetypes = ['markdown', 'pandoc', 'rmd']
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
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'vim-pandoc/vim-pandoc', { 'for': 'tex' }
Plug 'vim-pandoc/vim-pandoc-syntax'

autocmd FileType markdown set syntax=markdown.pandoc
let g:pandoc#syntax#conceal#blacklist = ["atx", "codeblock_start", "codeblock_delim", "quotes"]
let g:pandoc#modules#disabled = ["folding", "spell"]
let g:pandoc#syntax#codeblocks#embeds#langs = ["bash=sh", "java", "ps1", "python", "r", "sh"]

Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}

autocmd BufNewFile,BufRead *.Rmd set filetype=rmd
let R_auto_start = 1
let R_esc_term = 0
let R_close_term = 1
let R_args = ['--quiet', '--save']
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

nmap U <CMD>UndotreeToggle<CR>
Plug 'phaazon/hop.nvim'

map f <CMD>lua require'hop'.hint_words()<CR>

Plug 'chaoren/vim-wordmotion'
Plug 'vim-scripts/loremipsum'
Plug 'nvim-lualine/lualine.nvim'
" TODO: Make my own version of this, use https://vi.stackexchange.com/questions/25996/write-register-0-to-file
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
let g:bullets_enabled_file_types = ['markdown', 'rmd', 'tex']

autocmd FileType markdown nmap <LocalLeader><Space> <CMD>ToggleCheckbox<CR>
autocmd FileType markdown noremap o <CMD>InsertNewBullet<CR>
autocmd FileType markdown inoremap <CR> <CMD>InsertNewBullet<CR>

Plug 'mg979/vim-visual-multi'
Plug 'lewis6991/gitsigns.nvim'

nmap <Leader>b <CMD>Gitsigns toggle_current_line_blame<CR>

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

  let g:himalaya_mailbox_picker = 'telescope'
  let g:himalaya_telescope_preview_enabled = 1
endif

Plug 'othree/eregex.vim'
Plug 'jiangmiao/auto-pairs'

let g:AutoPairsMapCh = 0

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

nmap tp <CMD>TSPlaygroundToggle<CR>

Plug 'theHamsta/nvim-treesitter-pairs'
Plug 'Olical/aniseed' " Requied for tree-docs
Plug 'nvim-treesitter/nvim-tree-docs'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'p00f/nvim-ts-rainbow'
Plug 'SmiteshP/nvim-gps'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
" TODO: make this work without a prefixed `./`
Plug 'hrsh7th/cmp-path'
Plug 'f3fora/cmp-nuspell'
" TODO: make this work for tex math
Plug 'hrsh7th/cmp-calc'
Plug 'hrsh7th/cmp-emoji'
" TODO: Should I keep this or replace it with a snippet thing that I can tab
" through?
" Plug 'fiorematteo/cmp-katex'
" TODO: Consider the alternatives to this that are also supported by nvim-cmp
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'mtoohey31/cmp-fish'

let g:completion_enable_snippet = 'UltiSnips'
let g:UltiSnipsExpandTrigger="<NUL>"
let g:UltiSnipsJumpForwardTrigger="<NUL>"
let g:UltiSnipsJumpBackwardTrigger="<NUL>"
autocmd FileType markdown let g:completion_trigger_character = ['`', "#"]
inoremap <expr> <Tab> pumvisible() ? "\<Down>" : "\<CMD>call JumpForwardsOrIndent()<CR>"
inoremap <expr> <S-Tab> pumvisible() ? "\<Up>" : "\<CMD>call JumpBackwardsOrIndent()<CR>"

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
" TODO: Fix this after completion changes
" Plug 'cbarrete/completion-vcard'

" TODO: Fix telescope live grep colon filetypes

Plug 'jose-elias-alvarez/null-ls.nvim'
call plug#end()
" }}}

" TODO: Remove this one contextcommend is fixed for rmd
" autocmd FileType markdown,rmd setlocal commentstring=<!--%s-->
colorscheme tgc_wal

" lua {{{
lua << EOF
package.path = os.getenv("HOME") .. "/.cache/wal/?.lua;" .. package.path
require('gitsigns').setup({
  signs = {
    add          = { hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn' },
    change       = { hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
    delete       = { hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
    topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
    changedelete = { hl = 'GitSignsChange', text = '≃', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
  },
  attach_to_untracked = false,
  current_line_blame_opts = { delay = 0 },
  keymaps = {}
})
require'hop'.setup({})
require'nvim-treesitter.configs'.setup{
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true
  },
  indent = { enable = true },
  refactor = {
    highlight_definitions = { enable = true }
  },
  -- TODO: Get this working
  tree_docs = {
    enable = true,
    keymaps = {
      doc_node_at_cursor = "td",
      doc_node_at_cursor = "td"
    }
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    colors = require'colors'.colors,
    termcolors = { "0", "1", "2", "3", "4", "5", "6", "7", "0", "1", "2", "3", "4", "5", "6", "7" }
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    config = {
      markdown = {
        __default = '<!-- %s -->',
        -- TODO: make this dynamic based on language of code block
        code_fence_content = '# %s',
        setext_heading = '# %s'
      },
      rmd = {
        __default = '<!-- %s -->',
        -- TODO: make this dynamic based on language of code block
        code_fence_content = '# %s',
        setext_heading = '# %s'
      },
    }
  },
  playground = {
    enable = true
  },
  pairs = {
    enable = true,
    disable = {},
    highlight_pair_events = {}, -- e.g. {"CursorMoved"}, -- when to highlight the pairs, use {} to deactivate highlighting
    highlight_self = false, -- whether to highlight also the part of the pair under cursor (or only the partner)
    goto_right_end = false, -- whether to go to the end of the right partner or the beginning
    fallback_cmd_normal = "call matchit#Match_wrapper('',1,'n')", -- What command to issue when we can't find a pair (e.g. "normal! %")
    keymaps = {
      goto_partner = "<leader>%",
      delete_balanced = "X",
    },
    delete_balanced = {
      only_on_first_char = false, -- whether to trigger balanced delete when on first character of a pair
      fallback_cmd_normal = nil, -- fallback command when no pair found, can be nil
      longest_partner = false, -- whether to delete the longest or the shortest pair when multiple found.
                               -- E.g. whether to delete the angle bracket or whole tag in  <pair> </pair>
    }
  }
}

local gps = require'nvim-gps'
gps.setup()

local function word_count()
  local wc = vim.fn.wordcount()
  return tostring( wc.visual_words ~= nil and wc.visual_words or wc.words ) .. "W"
end

require'lualine'.setup({
  options = {
    theme = 'pywal'
  },
  sections = {
    lualine_c = {
      'filename',
      { gps.get_location, cond = gps.is_available }
    },
    lualine_x = { 'filetype' },
    lualine_y = { { word_count , cond = function() return vim.o.ft=="markdown" end }, 'progress' }
  }
})
require'colorizer'.setup()
local nvim_lsp = require('lspconfig')
-- local nvim_completion = require('completion')
-- nvim_completion.addCompletionSource('fish', require'completion-fish'.complete_item)
-- require'completion_vcard'.setup_completion('~/.contacts/32')

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
  vim.opt.signcolumn = "yes"
  vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})]]
  -- TODO: check if we're in a repository owned by someone else or a fork of a
  -- repository owned by someone else, and if we are, don't register this
  -- autocommand.
  vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)]]

  -- nvim_completion.on_attach(client, bufnr)
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = { "ansiblels", "bashls", "ccls", "cssls", "dockerls", "gopls", "html", "jsonls", "pyright", "r_language_server", "rls", "svelte", "tailwindcss", "taplo", "tsserver", "vimls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = capabilities
  }
end

nvim_lsp.diagnosticls.setup({
   on_attach = on_attach,
   filetypes = { "css", "dockerfile", "fish", "java", "javascript", "lua", "markdown", "python",  "rmd", "sh", "typescript", "typescriptreact", "yaml" },
   init_options = {
      formatters = {
         autopep = {
            command = "autopep8",
            args = { "-" }
         },
         fish_indent = {
           command = "fish_indent"
         },
         google_java_format = {
           command = "google-java-format",
            args = { "--aosp", "-" }
         },
         prettier = {
            command = "prettier",
            args = { "--stdin-filepath", "%filename" }
         },
         stylua = {
            command = "stylua",
            args = { "--search-parent-directories", "--indent-type", "spaces", "--indent-width", tostring(vim.o.tabstop), "--stdin-filepath", "%filepath", "--", "-" }
         }
      },
      linters = {
         cspell = {
            command = "cspell",
            debounce = 100,
            args = { "--config", "/home/mtoohey/.config/nvim/cspell.yaml", "stdin" },
            sourceName = "cspell",
            formatLines = 1,
            formatPattern = { ".*?:(\\d+):(\\d+)\\s*-\\s*(.*)", { line = 1, column = 2, message = 3 } }
         },
         fish = {
            command = "fish",
            args = { "-n", "%file" },
            isStdout = false,
            isStderr = true,
            sourceName = "fish",
            formatLines = 1,
            formatPattern = { "^.*\\(line (\\d+)\\): (.*)$", { line = 1, message = 2 } }
         },
         hadolint = {
            command = "hadolint",
            sourceName = "hadolint",
            args = {
              "-f",
              "json",
              "-"
            },
            rootPatterns = { ".hadolint.yaml" },
            parseJson = {
              line = "line",
              column = "column",
              security = "level",
              message = "${message} [${code}]"
            },
            securities = {
              error = "error",
              warning = "warning",
              info = "info",
              style = "hint"
            }
          },
          languagetool = {
             command = "languagetool",
             debounce = 200,
             args = { "-" },
             offsetLine = 0,
             offsetColumn = 0,
             sourceName = "languagetool",
             formatLines = 2,
             formatPattern = {
                "^\\d+?\\.\\)\\s+Line\\s+(\\d+),\\s+column\\s+(\\d+),\\s+([^\\n]+)\nMessage:\\s+(.*)(\\r|\\n)*$",
                { line = 1, column = 2, message = { 4, 3 } }
            },
         },
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
                  message = { 4 }
               }
            }
         },
         shellcheck = {
            command = "shellcheck",
            debounce = 100,
            args = {
               "--format",
               "json",
               "-"
            },
            sourceName = "shellcheck",
            parseJson = {
              line = "line",
              column = "column",
              endLine = "endLine",
              endColumn = "endColumn",
              message = "${message} [${code}]",
              security = "level"
            },
            securities = {
              error = "error",
              warning = "warning",
              info = "info",
              style = "hint"
            }
         }
      },
      filetypes = {
         dockerfile = "hadolint",
         mail = {
            "cspell",
            -- TODO: Fix this
            -- "languagetool"
         },
         markdown = {
            "cspell",
            "markdownlint",
            -- "languagetool"
         },
         rmd = {
            "cspell",
            "markdownlint",
            -- "languagetool"
         },
         sh = "shellcheck"
      },
      formatFiletypes = {
         fish = "fish_indent",
         java = "google_java_format",
         lua = "stylua",
         -- TODO: Fix this so it doesn't mess up my bullets
         -- markdown = "prettier",
         -- rmd = "prettier",
         python = "autopep",
         css = "prettier",
         javascript = "prettier",
         typescript = "prettier",
         typescriptreact =  "prettier",
         yaml = "prettier",
      }
   },
   capabilities = capabilities
})

nvim_lsp.java_language_server.setup {
  cmd = { "java-language-server" },
  on_attach = on_attach,
  settings = {
    java = {
      externalDependencies = {
        "com.sun.net.httpserver:http:20070405",
        "org.junit.jupiter:junit-jupiter-api:5.7.0",
        "org.junit.jupiter:junit-jupiter-engine:5.7.0",
        "javax.json:javax.json-api:1.1.4",
        "org.glassfish:javax.json:1.1.4",
        "org.json:json:20210307"
      }
    }
  },
  flags = {
    debounce_text_changes = 150,
   },
   capabilities = capabilities
}

nvim_lsp.omnisharp.setup {
  cmd = { "/usr/bin/omnisharp", "--languageserver" , "--hostPID", tostring(vim.fn.getpid()) },
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = capabilities
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
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.texlab.setup{
  settings = {
    texlab = { forwardSearch = {
        executable = "zathura",
        args = { "--synctex-forward", "%l:1:%f", "%p" }
      }
    }
  },
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = capabilities
}

local yamlls_settings = { yaml = { schemas = {} } }
yamlls_settings.yaml.schemas["/home/mtoohey/repos/yams/schema.yaml"] = "recipes/**/*.yaml"
yamlls_settings.yaml.schemas["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "/docker-compose*.yaml"

nvim_lsp.yamlls.setup {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  settings = yamlls_settings,
  capabilities = capabilities
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

local cmp = require'cmp'

require'nuspell'

cmp.setup({
  snippet = {
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
  },
  sources = cmp.config.sources({
    { name = 'fish' },
    { name = 'nvim_lsp' },
    { name = 'ultisnips' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'nuspell' },
    { name = 'calc' },
    { name = 'emoji' }
  })
})

local null_ls = require("null-ls")
null_ls.config({ sources = { require'cmp-nuspell.null-ls' } })
require("lspconfig")["null-ls"].setup({
  on_attach = on_attach,
  autostart = true
})
EOF
" }}}

autocmd BufWinEnter,WinEnter term://* startinsert
autocmd TermOpen * setlocal nonumber norelativenumber
