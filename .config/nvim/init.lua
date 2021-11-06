local api = vim.api
local map = api.nvim_set_keymap
local cmd = vim.cmd
map("n", "<SPACE>", "<NOP>", { noremap = true })
map("n", "<BS>", "<NOP>", { noremap = true })
cmd([[let mapleader = "\<BS>"]])
vim.g.maplocalleader = " "

-- TODO: https://github.com/windwp/nvim-autopairs
-- TODO: https://github.com/mfussenegger/nvim-dap
-- TODO: Fix telescope live grep colon filetypes
-- TODO: Get dictionary lookup with K for words when lsp hover isn't available
-- TODO: Add noa writes to compile and execute commands
-- TODO: async formatting, formatting in background?

map("n", "Q", "<CMD>quitall!<CR>", {})
map("n", "W", "<CMD>noa write<CR>", {})
map("n", "Z", "<CMD>wq<CR>", {})

map("n", "$", "g_", {})
map("v", "$", "g_", {})

map("n", "<Leader>h", "<CMD>noh<CR>", {})
map("n", "<Leader>Dm", '<CMD>redir @" \\| silent map \\| redir END \\| new \\| put!<CR>', {})
-- TSHighlightCapturesUnderCursor
map("n", "<Leader>DH", '<CMD>redir @" \\| silent hi \\| redir END \\| new \\| put!<CR>', {})
map(
  "n",
  "<Leader>Dh",
  '<CMD>echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . \'> trans<\' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>',
  {}
)

map("n", "<Leader>qo", "<CMD>copen<CR>", {})
map("n", "<Leader>qc", "<CMD>cclose<CR>", {})

map("n", "n", "nzzzv", { noremap = true })
map("n", "N", "Nzzzv", { noremap = true })

map("i", ",", ",<C-g>u", { noremap = true })
map("i", ".", ".<C-g>u", { noremap = true })
map("i", "!", "!<C-g>u", { noremap = true })
map("i", "?", "?<C-g>u", { noremap = true })
map("i", '"', '"<C-g>u', { noremap = true })
map("i", "'", "<C-g>u", { noremap = true })
map("i", "(", "(<C-g>u", { noremap = true })
map("i", "[", "[<C-g>u", { noremap = true })
map("i", "{", "{<C-g>u", { noremap = true })
map("i", "}", "}<C-g>u", { noremap = true })
map("i", "]", "]<C-g>u", { noremap = true })
map("i", ")", ")<C-g>u", { noremap = true })
map("i", "<CR>", "<CR><C-g>u", { noremap = true })

map("v", "J", ":m '>+1<CR>gv=gv", {})
map("v", "K", ":m '>-2<CR>gv=gv", {})

map("n", "p", '"+p', { noremap = true })
map("n", "P", '"+P', { noremap = true })
map("v", "p", '"+p', { noremap = true })
map("v", "P", '"+P', { noremap = true })

map("n", "y", '"+y', { noremap = true })
map("n", "Y", '"+Y', { noremap = true })
map("v", "y", '"+y', { noremap = true })
map("v", "Y", '"+Y', { noremap = true })

map("n", "d", '"+d', { noremap = true })
map("n", "D", '"+D', { noremap = true })
map("v", "d", '"+d', { noremap = true })
map("v", "D", '"+D', { noremap = true })

map("i", "<F1>", "<NUL>", {})
map("i", "<F2>", "<NUL>", {})
map("i", "<F3>", "<NUL>", {})
map("i", "<F4>", "<NUL>", {})
map("i", "<F5>", "<NUL>", {})
map("i", "<F6>", "<NUL>", {})
map("i", "<F7>", "<NUL>", {})
map("i", "<F8>", "<NUL>", {})
map("i", "<F9>", "<NUL>", {})
map("i", "<F10>", "<NUL>", {})
map("i", "<F11>", "<NUL>", {})
map("i", "<F12>", "<NUL>", {})

map("o", "i*", ":<C-U>normal! T*vt*<CR>", { silent = true })
map("v", "i*", ":<C-U>normal! T*vt*<CR>", { silent = true })
map("o", "a*", ":<C-U>normal! F*vf*<CR>", { silent = true })
map("v", "a*", ":<C-U>normal! F*vf*<CR>", { silent = true })
map("o", "i$", ":<C-U>normal! T$vt$<CR>", { silent = true })
map("v", "i$", ":<C-U>normal! T$vt$<CR>", { silent = true })
map("o", "a$", ":<C-U>normal! F$vf$<CR>", { silent = true })
map("v", "a$", ":<C-U>normal! F$vf$<CR>", { silent = true })

map("i", "<C-h>", "<C-g>u<ESC>vbs", { noremap = true })
map("i", "<C-BS>", "<C-g>u<ESC>vbs", { noremap = true })
map("i", "<C-z>", "<C-o>u", { noremap = true })

map("n", "<Tab>", ">>", {})
map("n", "<S-Tab>", "<<", {})

map("v", "<Tab>", ">gv", {})
map("v", "<S-Tab>", "<gv", {})

map("t", "<C-w>", "<C-\\><C-n><C-w>", {})

cmd([[autocmd FileType java nmap <buffer> <LocalLeader><CR> <CMD>!java %<CR>]])
cmd(
  [[autocmd FileType markdown,pandoc,rmd,tex nmap <buffer> <LocalLeader>z <CMD>call system('zth "' . expand('%:p:r') . '.pdf"')<CR>]]
)
cmd(
  [[autocmd FileType markdown,pandoc nmap <buffer> <LocalLeader>p <CMD>call system('pandoc --metadata-file $HOME/.config/pandoc/default-metadata.yaml -f markdown "' . expand('%:p') . '" -t pdf --pdf-engine=xelatex -o "' . expand('%:p:r') . '.pdf" &')<CR>]]
)
cmd(
  [[autocmd FileType markdown,pandoc nmap <buffer> <LocalLeader>P <CMD>execute('!pandoc --metadata-file $HOME/.config/pandoc/default-metadata.yaml -f markdown "' . expand('%:p') . '" -t pdf --pdf-engine=xelatex -o "' . expand('%:p:r') . '.pdf"')<CR>]]
)
cmd([[autocmd FileType markdown,pandoc,rmd nmap <buffer> <LocalLeader>i <CMD>call mdip#MarkdownClipboardImage()<CR>]])
map(
  "n",
  "<LocalLeader>t",
  '<CMD>lua require(\'truth_table\')(vim.fn.input("separator: "), vim.fn.input("left border: "), vim.fn.input("right border: "))<CR>',
  {}
)
cmd([[autocmd FileType text nmap <buffer> <LocalLeader>t <CMD>lua require('truth_table')(" ")<CR>]])
cmd(
  [[autocmd FileType markdown,pandoc nmap <buffer> <LocalLeader>t <CMD>lua require('truth_table')(" <BAR> ", "<BAR> ", " <BAR>")<CR>]]
)
cmd([[autocmd FileType python nmap <buffer> <LocalLeader><CR> <CMD>!python3 %<CR>]])
cmd([[autocmd FileType tex nmap <buffer> <LocalLeader><CR> <CMD>noa w <BAR> TexlabBuild<CR>]])
cmd([[autocmd FileType tex nmap <buffer> <LocalLeader>f <CMD>TexlabForward<CR>]])

cmd([[autocmd FileType rmd nmap <buffer> <LocalLeader>kp <Plug>RMakePDFK]])
cmd([[autocmd FileType rmd nmap <buffer> <LocalLeader>kh <Plug>RMakeHTML]])
cmd([[autocmd FileType rmd nmap <buffer> <LocalLeader>h <Plug>RSendChunkFH]])
cmd([[autocmd FileType rmd nmap <buffer> <LocalLeader>c <Plug>RESendChunk]])
cmd([[autocmd FileType rmd nmap <buffer> <LocalLeader>o <Plug>ROpenLists]])
cmd([[autocmd FileType rmd nmap <buffer> <LocalLeader>n <Plug>RNextRChunk]])
cmd([[autocmd FileType rmd nmap <buffer> <LocalLeader>N <Plug>RPreviousRChunk]])
cmd([[autocmd FileType rmd nmap <buffer> <LocalLeader>l <Plug>RSendLine]])

cmd([[autocmd FileType markdown,pandoc inoremap <buffer> <S-CR> <CR><CR>---<CR><CR>]])

vim.g.cursorhold_updatetime = 250
vim.o.foldmethod = "marker"
-- vim.o.shortmess:append("c")
cmd([[set shortmess += "c"]])
if os.getenv("SSH_CONNECTION") ~= nil then
  vim.o.pumblend = 20
end
vim.o.guifont = "JetBrainsMono Nerd Font:h14"
vim.o.pumheight = 15
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = "a"
vim.o.scrolloff = 7
vim.o.list = true
vim.o.listchars = "tab:›\\ ,trail:•,extends:#,nbsp:."
vim.o.timeout = false
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.autoindent = true
cmd([[
syntax on
filetype plugin indent on
]])
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.showmode = false
vim.o.fillchars = "fold: ,vert:│,eob: ,msgsep:‾"
vim.o.compatible = false
vim.o.termguicolors = true
cmd(
  [[au BufReadPost * silent if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' | exe "normal! g`\"zv" | endif]]
)
cmd([[autocmd FileType * let b:AutoPairs = AutoPairsDefine({'\v(^|\W)\zs''':"'"})]])

cmd([[autocmd FileType java set shiftwidth=4]])
cmd([[autocmd FileType markdown,pandoc,rmd set softtabstop=1]])
cmd([[autocmd FileType java set softtabstop=4]])
cmd([[autocmd FileType python set colorcolumn=80]])
cmd([[autocmd FileType lua set colorcolumn=120]])
cmd([[autocmd FileType lua let b:AutoPairs = AutoPairsDefine({'\v(^|.)\zs''':"'"}, ['\v(^|\W)\zs'''])]])
cmd([[autocmd FileType vim let b:AutoPairs = AutoPairsDefine({'<':'>'})]])
cmd(
  [[" autocmd FileType markdown,pandoc,rmd let g:AutoPairs = AutoPairsDefine({'*':'*', '**':'**', '_':'_', '$':'$', '$$':'$$', "<!--":'-->'})]]
)
cmd([[autocmd FileType markdown,pandoc,rmd let g:AutoPairs = AutoPairsDefine({'$':'$', '$$':'$$', "<!--":'-->'})]])
cmd([[autocmd FileType tex let g:AutoPairs = AutoPairsDefine({'$':'$', '$$':'$$', '``':"''"}, ['`', "'"])]])
cmd([[autocmd FileType rust let b:AutoPairs = AutoPairsDefine({'\w\zs<': '>'})]])

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end

local packer = require("packer")
packer.startup(function(use)
  use("wbthomason/packer.nvim")
  use({
    "sheerun/vim-polyglot",
    setup = function()
      vim.g.polyglot_disabled = { "autoindent" }
    end,
    config = function()
      vim.g.polyglot_disabled = { "markdown", "svelte", "ansible", "docker-compose" }
    end,
  })
  use({
    "leafOfTree/vim-svelte-plugin",
    ft = "svelte",
    config = function()
      vim.g.vim_svelte_plugin_use_typescript = 1
    end,
  })
  use({
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"](0)
    end,
    ft = { "markdown", "pandoc", "rmd" },
    config = function()
      vim.g.mkdp_highlight_css = os.getenv("HOME") .. "/.cache/wal/colors.css"
      vim.g.mkdp_page_title = "${name}.md"
      vim.g.mkdp_filetypes = { "markdown", "pandoc", "rmd" }
      vim.g.mkdp_command_for_global = 1
      vim.g.mkdp_preview_options = {
        katex = {
          macros = {},
        },
        sync_scroll_type = "middle",
        hide_yaml_meta = 1,
        disable_filename = 1,
      }
      vim.g.mkdp_preview_options.katex.macros["\\st"] = "\\text{ s.t. }"
      vim.g.mkdp_markdown_css = vim.fn.fnamemodify(os.getenv("MYVIMRC"), ":h") .. "markdown-preview.css"
      vim.cmd([[autocmd FileType markdown,pandoc,rmd nmap <buffer> <LocalLeader>h <Plug>MarkdownPreviewToggle]])
    end,
  })
  use("tpope/vim-sleuth")
  use("tpope/vim-commentary")
  use("tpope/vim-surround")
  use("tpope/vim-fugitive")
  use({ "vim-pandoc/vim-pandoc", ft = "tex" })
  use({
    "vim-pandoc/vim-pandoc-syntax",
    ft = { "markdown", "pandoc", "rmd" },
    config = function()
      -- vim.cmd([[autocmd FileType markdown set syntax=markdown.pandoc]])
      vim.g["pandoc#syntax#conceal#blacklist"] = {
        "atx",
        "codeblock_start",
        "codeblock_delim",
        "quotes",
      }
      vim.g["pandoc#modules#disabled"] = { "folding", "spell" }
      vim.g["pandoc#syntax#codeblocks#embeds#langs"] = {
        "bash=sh",
        "java",
        "ps1",
        "python",
        "r",
        "sh",
      }
    end,
  })
  use("antoinemadec/FixCursorHold.nvim")
  use({
    "jalvesaq/Nvim-R",
    branch = "stable",
    ft = { "rmd", "r" },
    config = function()
      vim.cmd([[autocmd BufNewFile,BufRead *.Rmd set filetype=rmd]])
      vim.g.R_auto_start = 1
      vim.g.R_esc_term = 0
      vim.g.R_close_term = 1
      vim.g.R_args = { "--quiet", "--save" }
      vim.g.R_assign = 0
      vim.g.R_openpdf = 1
      vim.g.R_openhtml = 0
      vim.g.R_user_maps_only = 1
    end,
  })
  use({
    "mbbill/undotree",
    config = function()
      if vim.fn.has("persistent_undo") then
        vim.o.undodir = vim.fn.stdpath("data") .. "/undodir"

        if not vim.fn.isdirectory(vim.o.undodir) then
          vim.fn.mkdir(vim.o.undodir, "p", 0700)
        end

        vim.o.undofile = true
      end
      vim.api.nvim_set_keymap("n", "U", "<CMD>UndotreeToggle<CR>", {})
    end,
  })
  use({
    "phaazon/hop.nvim",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "f", "<CMD>lua require'hop'.hint_words()<CR>", {})
      vim.api.nvim_set_keymap("v", "f", "<CMD>lua require'hop'.hint_words()<CR>", {})
    end,
  })
  use("chaoren/vim-wordmotion")
  use("vim-scripts/loremipsum")
  use({
    "nvim-lualine/lualine.nvim",
    config = function()
      local gps = require("nvim-gps")
      require("lualine").setup({
        options = {
          theme = "pywal",
        },
        sections = {
          lualine_c = {
            "filename",
            { gps.get_location, cond = gps.is_available },
          },
          lualine_x = { "filetype" },
          lualine_y = {
            {
              function()
                local wc = vim.fn.wordcount()
                return tostring(wc.visual_words ~= nil and wc.visual_words or wc.words) .. "W"
              end,
              cond = function()
                return vim.o.ft == "markdown" or vim.o.ft == "pandoc"
              end,
            },
            "progress",
          },
        },
      })
    end,
    after = "nvim-gps",
  })
  -- TODO: Make my own version of this, use https://vi.stackexchange.com/questions/25996/write-register-0-to-file
  use({
    "ferrine/md-img-paste.vim",
    ft = { "markdown", "pandoc", "rmd" },
    config = function()
      vim.g.mdip_imgdir = vim.fn.expand("%:t:r")
      vim.g.mdip_imgdir_intext = vim.fn.escape(vim.fn.expand("%:t:r"), " ")
    end,
  })
  use({
    "mtoohey31/doctest.nvim",
    ft = "python",
    run = function()
      cmd("UpdateRemotePlugins")
    end,
  })
  use("mtoohey31/truth-table.nvim")
  use({
    "reedes/vim-pencil",
    ft = { "markdown", "pandoc", "rmd", "tex" },
    config = function()
      vim.g["pencil#conceallevel"] = 2
      vim.g["pencil#wrapModeDefault"] = "soft"
      vim.g["pencil#cursorwrap"] = 0
      vim.cmd([[autocmd FileType markdown,pandoc,rmd,tex call pencil#init()]])
    end,
  })
  use({
    "dkarter/bullets.vim",
    config = function()
      vim.g.bullets_set_mappings = 0
      vim.g.bullets_outline_levels = { "ABC", "num", "std-" }
      vim.g.bullets_checkbox_markers = " ox"
      vim.g.bullets_renumber_on_change = 0
      vim.g.bullets_enabled_file_types = { "markdown", "pandoc", "rmd", "tex" }

      vim.cmd(
        "autocmd FileType "
          .. vim.fn.join(vim.g.bullets_enabled_file_types, ",")
          .. " nmap <LocalLeader><Space> <CMD>ToggleCheckbox<CR>"
      )
      vim.cmd(
        "autocmd FileType "
          .. vim.fn.join(vim.g.bullets_enabled_file_types, ",")
          .. " noremap o <CMD>InsertNewBullet<CR>"
      )
      vim.cmd(
        "autocmd FileType "
          .. vim.fn.join(vim.g.bullets_enabled_file_types, ",")
          .. " inoremap <CR> <CMD>InsertNewBullet<CR>"
      )
    end,
  })
  use("mg979/vim-visual-multi")
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { hl = "GitSignsAdd", text = "+", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
          change = {
            hl = "GitSignsChange",
            text = "~",
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn",
          },
          delete = {
            hl = "GitSignsDelete",
            text = "-",
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn",
          },
          topdelete = {
            hl = "GitSignsDelete",
            text = "‾",
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn",
          },
          changedelete = {
            hl = "GitSignsChange",
            text = "≃",
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn",
          },
        },
        attach_to_untracked = false,
        current_line_blame_opts = { delay = 0 },
        keymaps = {},
      })
      vim.api.nvim_set_keymap("n", "<Leader>b", "<CMD>Gitsigns toggle_current_line_blame<CR>", {})
    end,
    requires = { "nvim-lua/plenary.nvim" },
  })
  use({
    "mtoohey31/tgc_wal.vim",
    config = function()
      vim.cmd("colorscheme tgc_wal")
    end,
  })
  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  })
  use("nvim-lua/popup.nvim")
  use({
    "nvim-telescope/telescope.nvim",
    config = function()
      vim.api.nvim_set_keymap("n", "tg", "<CMD>Telescope live_grep<CR>", {})
      vim.api.nvim_set_keymap("n", "tf", "<CMD>Telescope find_files<CR>", {})
      vim.api.nvim_set_keymap("n", "tt", "<CMD>Telescope filetypes<CR>", {})
      vim.api.nvim_set_keymap("n", "tb", "<CMD>Telescope git_branches<CR>", {})
    end,
    requires = { "nvim-lua/plenary.nvim" },
  })
  use({
    "mtoohey31/chafa.vim",
    rtp = "vim",
    cond = function()
      return os.execute("which himalaya") == 0
    end,
    config = function()
      vim.g.himalaya_mailbox_picker = "telescope"
      vim.g.himalaya_telescope_preview_enabled = true
    end,
  })
  use("othree/eregex.vim")
  use({
    "jiangmiao/auto-pairs",
    config = function()
      vim.g.AutoPairsMapCh = 0
    end,
  })
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      cmd([['TSUpdate']])
    end,
    config = function()
      package.path = os.getenv("HOME") .. "/.cache/wal/?.lua;" .. package.path
      require("nvim-treesitter.configs").setup({
        ensure_installed = "all",
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = true,
        },
        indent = { enable = true },
        refactor = {
          highlight_definitions = { enable = true },
        },
        -- TODO: Get this working
        tree_docs = {
          enable = true,
          keymaps = {
            doc_node_at_cursor = "td",
          },
        },
        rainbow = {
          enable = true,
          extended_mode = true,
          colors = require("colors").colorful,
          termcolors = { "1", "2", "3", "4", "5", "6", "7", "1", "2", "3", "4", "5", "6", "7", "1", "2" },
        },
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
          config = {
            markdown = {
              __default = "<!-- %s -->",
              -- TODO: make this dynamic based on language of code block
              code_fence_content = "# %s",
              setext_heading = "# %s",
            },
            pandoc = {
              __default = "<!-- %s -->",
              -- TODO: make this dynamic based on language of code block
              code_fence_content = "# %s",
              setext_heading = "# %s",
            },
            rmd = {
              __default = "<!-- %s -->",
              -- TODO: make this dynamic based on language of code block
              code_fence_content = "# %s",
              setext_heading = "# %s",
            },
          },
        },
        playground = {
          enable = true,
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
          },
        },
      })
    end,
  })
  use({
    "nvim-treesitter/playground",
    config = function()
      vim.api.nvim_set_keymap("n", "tp", "<CMD>TSPlaygroundToggle<CR>", {})
    end,
    after = "nvim-treesitter",
  })
  use({ "theHamsta/nvim-treesitter-pairs", after = "nvim-treesitter" })
  use({ "nvim-treesitter/nvim-tree-docs", requires = { "Olical/aniseed" }, after = "nvim-treesitter" })
  use({ "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" })
  use({ "p00f/nvim-ts-rainbow", after = "nvim-treesitter" })
  use({
    "SmiteshP/nvim-gps",
    config = function()
      require("nvim-gps").setup()
    end,
    after = "nvim-treesitter",
  })
  use({
    "JoosepAlviste/nvim-ts-context-commentstring",
    setup = function()
      -- TODO: remove this after fixing contextcomment for rmd
      vim.cmd([[autocmd FileType markdown,pandoc,rmd setlocal commentstring=<!--%s-->]])
    end,
    after = "nvim-treesitter",
  })
  use({
    "neovim/nvim-lspconfig",
    as = "lspconfig",
    config = function()
      local nvim_lsp = require("lspconfig")
      -- local nvim_completion = require('completion')
      -- nvim_completion.addCompletionSource('fish', require'completion-fish'.complete_item)
      -- require'completion_vcard'.setup_completion('~/.contacts/32')

      local on_attach = function(_, bufnr)
        local function buf_map(...)
          vim.api.nvim_buf_set_keymap(bufnr, ...)
        end

        local opts = { noremap = false, silent = true }

        buf_map("n", "gd", "<cmd>split | lua vim.lsp.buf.definition()<CR>", opts)
        buf_map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
        buf_map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
        buf_map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
        buf_map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
        buf_map("n", "<Leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
        buf_map("n", "<Leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
        buf_map("n", "<Leader>F", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
        buf_map("n", "<Leader>N", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
        buf_map("n", "<Leader>n", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)

        vim.opt.signcolumn = "yes"

        vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})]])
        -- TODO: check if we're in a repository owned by someone else or a fork of a
        -- repository owned by someone else, and if we are, don't register this
        -- autocommand.
        vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)]])
      end

      local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

      local servers = {
        "ansiblels",
        "bashls",
        "ccls",
        "cssls",
        "dockerls",
        "gopls",
        "html",
        "jsonls",
        "pyright",
        "r_language_server",
        "rls",
        "svelte",
        "tailwindcss",
        "taplo",
        "tsserver",
        "vimls",
      }
      for _, lsp in ipairs(servers) do
        nvim_lsp[lsp].setup({
          on_attach = on_attach,
          flags = {
            debounce_text_changes = 150,
          },
          capabilities = capabilities,
        })
      end

      nvim_lsp.diagnosticls.setup({
        on_attach = on_attach,
        filetypes = {
          "css",
          "dockerfile",
          "fish",
          "java",
          "javascript",
          "lua",
          "markdown",
          "pandoc",
          "python",
          "rmd",
          "sh",
          "typescript",
          "typescriptreact",
          "yaml",
        },
        init_options = {
          formatters = {
            autopep = {
              command = "autopep8",
              args = { "-" },
            },
            fish_indent = {
              command = "fish_indent",
            },
            google_java_format = {
              command = "google-java-format",
              args = { "--aosp", "-" },
            },
            prettier = {
              command = "prettier",
              args = { "--stdin-filepath", "%filename" },
            },
            stylua = {
              command = "stylua",
              args = {
                "--search-parent-directories",
                "--indent-type",
                "spaces",
                "--indent-width",
                tostring(vim.o.tabstop),
                "--stdin-filepath",
                "%filepath",
                "--",
                "-",
              },
            },
          },
          linters = {
            cspell = {
              command = "cspell",
              debounce = 100,
              args = { "--config", "/home/mtoohey/.config/nvim/cspell.yaml", "stdin" },
              sourceName = "cspell",
              formatLines = 1,
              formatPattern = {
                ".*?:(\\d+):(\\d+)\\s*-\\s*(.*)",
                { line = 1, column = 2, message = 3 },
              },
            },
            fish = {
              command = "fish",
              args = { "-n", "%file" },
              isStdout = false,
              isStderr = true,
              sourceName = "fish",
              formatLines = 1,
              formatPattern = { "^.*\\(line (\\d+)\\): (.*)$", { line = 1, message = 2 } },
            },
            hadolint = {
              command = "hadolint",
              sourceName = "hadolint",
              args = {
                "-f",
                "json",
                "-",
              },
              rootPatterns = { ".hadolint.yaml" },
              parseJson = {
                line = "line",
                column = "column",
                security = "level",
                message = "${message} [${code}]",
              },
              securities = {
                error = "error",
                warning = "warning",
                info = "info",
                style = "hint",
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
                  message = { 4 },
                },
              },
            },
            shellcheck = {
              command = "shellcheck",
              debounce = 100,
              args = {
                "--format",
                "json",
                "-",
              },
              sourceName = "shellcheck",
              parseJson = {
                line = "line",
                column = "column",
                endLine = "endLine",
                endColumn = "endColumn",
                message = "${message} [${code}]",
                security = "level",
              },
              securities = {
                error = "error",
                warning = "warning",
                info = "info",
                style = "hint",
              },
            },
          },
          filetypes = {
            dockerfile = "hadolint",
            mail = {
              "cspell",
            },
            markdown = {
              "cspell",
              "markdownlint",
            },
            pandoc = {
              "cspell",
              "markdownlint",
            },
            rmd = {
              "cspell",
              "markdownlint",
            },
            sh = "shellcheck",
          },
          formatFiletypes = {
            fish = "fish_indent",
            java = "google_java_format",
            lua = "stylua",
            -- TODO: Fix this so it doesn't mess up my bullets
            -- markdown = "prettier",
            -- pandoc = "prettier",
            -- rmd = "prettier",
            python = "autopep",
            css = "prettier",
            javascript = "prettier",
            typescript = "prettier",
            typescriptreact = "prettier",
            yaml = "prettier",
          },
        },
        capabilities = capabilities,
      })

      nvim_lsp.java_language_server.setup({
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
              "org.json:json:20210307",
            },
          },
        },
        flags = {
          debounce_text_changes = 150,
        },
        capabilities = capabilities,
      })

      nvim_lsp.omnisharp.setup({
        cmd = { "/usr/bin/omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
        on_attach = on_attach,
        flags = {
          debounce_text_changes = 150,
        },
        capabilities = capabilities,
      })

      -- local sumneko_root_path = vim.fn.stdpath("cache") .. "/lspconfig/sumneko_lua/lua-language-server"
      local sumneko_binary = "/usr/bin/lua-language-server"

      local runtime_path = vim.split(package.path, ";")
      table.insert(runtime_path, "lua/?.lua")
      table.insert(runtime_path, "lua/?/init.lua")

      nvim_lsp.sumneko_lua.setup({
        cmd = { sumneko_binary, "-E", "/usr/share/lua-language-server/main.lua" },
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
              path = "/usr/bin/luajit",
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              maxPreload = 4000,
              preloadFileSize = 2000,
            },
            telemetry = {
              enable = false,
            },
          },
        },
        on_attach = on_attach,
        capabilities = capabilities,
      })

      nvim_lsp.texlab.setup({
        settings = {
          texlab = {
            forwardSearch = {
              executable = "zathura",
              args = { "--synctex-forward", "%l:1:%f", "%p" },
            },
          },
        },
        on_attach = on_attach,
        flags = {
          debounce_text_changes = 150,
        },
        capabilities = capabilities,
      })

      local yamlls_settings = { yaml = { schemas = {} } }
      yamlls_settings.yaml.schemas["/home/mtoohey/repos/yams/schema.yaml"] = "recipes/**/*.yaml"
      yamlls_settings.yaml.schemas["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] =
        "/docker-compose*.yaml"

      nvim_lsp.yamlls.setup({
        on_attach = on_attach,
        flags = {
          debounce_text_changes = 150,
        },
        settings = yamlls_settings,
        capabilities = capabilities,
      })

      local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

      for type, icon in pairs(signs) do
        local hl = "LspDiagnosticsSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = true,
      })
    end,
    after = "cmp-nvim-lsp",
  })
  use("hrsh7th/cmp-nvim-lsp")
  use({
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
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
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.close(),
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
          ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        },
        sources = cmp.config.sources({
          { name = "fish" },
          { name = "nvim_lsp" },
          { name = "ultisnips" },
          { name = "buffer" },
          { name = "path" },
          { name = "nuspell" },
          { name = "calc" },
          { name = "emoji" },
        }),
      })
    end,
  })
  use("hrsh7th/cmp-buffer")
  -- " TODO: make this work without a prefixed `./`
  use("hrsh7th/cmp-path")
  use({ "f3fora/cmp-nuspell", rocks = "lua-nuspell" })
  -- " TODO: make this work for tex math
  use("hrsh7th/cmp-calc")
  use("hrsh7th/cmp-emoji")
  -- " TODO: Should I keep this or replace it with a snippet thing that I can tab
  -- " through?
  -- " use 'fiorematteo/cmp-katex'
  -- " TODO: Consider the alternatives to this that are also supported by nvim-cmp
  use("SirVer/ultisnips")
  use("quangnguyen30192/cmp-nvim-ultisnips")
  use({ "mtoohey31/cmp-fish", ft = "fish" })

  -- TODO
  -- let g:completion_enable_snippet = 'UltiSnips'
  vim.g.UltiSnipsExpandTrigger = "<NUL>"
  vim.g.UltiSnipsJumpForwardTrigger = "<NUL>"
  vim.g.UltiSnipsJumpBackwardTrigger = "<NUL>"
  -- autocmd FileType markdown let g:completion_trigger_character = ['`', "#"]
  -- inoremap <expr> <Tab> pumvisible() ? "\<Down>" : "\<CMD>call JumpForwardsOrIndent()<CR>"
  -- inoremap <expr> <S-Tab> pumvisible() ? "\<Up>" : "\<CMD>call JumpBackwardsOrIndent()<CR>"

  -- function! JumpForwardsOrIndent()
  --       call UltiSnips#JumpForwards()
  --       if !g:ulti_jump_forwards_res
  --         call feedkeys("\<C-t>")
  --       endif
  -- endfunction

  -- function! JumpBackwardsOrIndent()
  --       call UltiSnips#JumpBackwards()
  --       if !g:ulti_jump_backwards_res
  --         call feedkeys("\<C-d>")
  --       endif
  -- endfunction
  use("honza/vim-snippets")
  -- " TODO: Fix this after completion changes
  -- " Plug 'cbarrete/completion-vcard'
  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("null-ls").config({
        sources = {
          -- require("cmp-nuspell.null-ls")
        },
      })
      local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
      -- TODO figure out how to fix this duplication
      local on_attach = function(_, bufnr)
        local function buf_map(...)
          vim.api.nvim_buf_set_keymap(bufnr, ...)
        end

        local opts = { noremap = false, silent = true }

        buf_map("n", "gd", "<cmd>split | lua vim.lsp.buf.definition()<CR>", opts)
        buf_map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
        buf_map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
        buf_map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
        buf_map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
        buf_map("n", "<Leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
        buf_map("n", "<Leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
        buf_map("n", "<Leader>F", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
        buf_map("n", "<Leader>N", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
        buf_map("n", "<Leader>n", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)

        vim.opt.signcolumn = "yes"

        vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})]])
        -- TODO: check if we're in a repository owned by someone else or a fork of a
        -- repository owned by someone else, and if we are, don't register this
        -- autocommand.
        vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)]])
      end
      require("lspconfig")["null-ls"].setup({
        on_attach = on_attach,
        flags = {
          debounce_text_changes = 150,
        },
        capabilities = capabilities,
      })
    end,
    after = { "lspconfig", "cmp-nvim-lsp" },
  })
  use({
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup()
    end,
  })
  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({
        vim.api.nvim_set_keymap("n", "T", "<CMD>TroubleToggle<CR>", {}),
      })
    end,
  })
  -- TODO: set this up
  use({
    "pwntester/octo.nvim",
    config = function()
      require("octo").setup()
    end,
  })
  use({
    "vuki656/package-info.nvim",
    requires = "MunifTanjim/nui.nvim",
    config = function()
      require("package-info").setup({ autostart = false })
    end,
  })
  -- TODO: set up cmp for this
  use({
    "Saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require("crates").setup()
    end,
  })
  if packer_bootstrap then
    require("packer").sync()
  end
  use("editorconfig/editorconfig-vim")
end)

cmd([[autocmd BufWinEnter,WinEnter term://* startinsert]])
cmd([[autocmd TermOpen * setlocal nonumber norelativenumber]])
