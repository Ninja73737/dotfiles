local api = vim.api
local map = api.nvim_set_keymap
local cmd = vim.cmd

map("n", "<SPACE>", "<NOP>", { noremap = true })
map("n", "<BS>", "<NOP>", { noremap = true })
cmd([[let mapleader = "\<BS>"]])
vim.g.maplocalleader = " "

-- TODO: https://github.com/mfussenegger/nvim-dap
-- TODO: https://github.com/seblj/nvim-tabline
-- TODO: fix telescope live grep colon filetypes
-- TODO: add noa writes to compile and execute commands
-- TODO: call nvim_put(["# " .. expand("%:r")], "c", v:false, v:true) (for markdown headers)
-- TODO: set up lspkind and name menu items for completion: https://www.youtube.com/watch?v=_DnmphIwnjo
-- TODO: add gh issues source for completion: https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/after/plugin/cmp_gh_source.lua

map("n", "Q", "<CMD>quitall!<CR>", {})
map("n", "W", "<CMD>write<CR>", {})
map("n", "Z", "<CMD>wq<CR>", {})

map("n", "$", "g_", {})
map("v", "$", "g_", {})

map("n", "<Leader>h", "<CMD>noh<CR>", {})

cmd([[command! DebugMap redir @" | silent map | redir END | new | put!]])
cmd([[command! DebugHi redir @" | silent hi | redir END | new | put!]])
cmd(
    [[command! DebugCurrentHi echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"]]
)

map("n", "<Leader>qo", "<CMD>copen<CR>", {})
map("n", "<Leader>qc", "<CMD>cclose<CR>", {})

map("n", "n", "nzzzv", { noremap = true })
map("n", "N", "Nzzzv", { noremap = true })

map("i", ",", ",<C-g>u", { noremap = true })
map("i", ".", ".<C-g>u", { noremap = true })
map("i", "!", "!<C-g>u", { noremap = true })
map("i", "?", "?<C-g>u", { noremap = true })
map("i", "<CR>", "<CR><C-g>u", { noremap = true })

map("v", "J", ":m '>+1<CR>gv=gv", {})
map("v", "K", ":m '>-2<CR>gv=gv", {})

map("n", "p", '"+p', { noremap = true })
map("n", "P", '"+P', { noremap = true })
map("v", "p", '"+p', { noremap = true })
map("v", "P", '"+P', { noremap = true })

map("n", "y", '"+y', { noremap = true })
map("v", "y", '"+y', { noremap = true })
map("n", "Y", "vg_O", { noremap = true })

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

map("i", "<C-h>", "<ESC>vlbs", {})
map("i", "<C-BS>", "<ESC>vlbs", {})
map("i", "<C-z>", "<C-o>u", { noremap = true })

map("n", "<Tab>", ">>", {})
map("n", "<S-Tab>", "<<", {})

map("v", "<Tab>", ">gv", {})
map("v", "<S-Tab>", "<gv", {})

map("t", "<C-w>", "<C-\\><C-n><C-w>", {})

cmd([[autocmd FileType java nmap <buffer> <LocalLeader><CR> <CMD>!java %<CR>]])
cmd(
    [[autocmd BufNewFile *.md,*.rmd if expand('%:p') !~ '.*/cards/.*' | call nvim_put(["# " .. expand("%:r")], "c", v:false, v:true) | endif]]
)
cmd(
    [[autocmd FileType markdown,rmd,tex nmap <buffer> <LocalLeader>z <CMD>call system('zth "' . expand('%:p:r') . '.pdf"')<CR>]]
)
cmd(
    [[autocmd FileType markdown nmap <buffer> <LocalLeader>p <CMD>call system('pandoc --metadata-file $HOME/.config/pandoc/default-metadata.yaml -f markdown "' . expand('%:p') . '" -t pdf --pdf-engine=xelatex -o "' . expand('%:p:r') . '.pdf" &')<CR>]]
)
cmd(
    [[autocmd FileType markdown, nmap <buffer> <LocalLeader>P <CMD>execute('!pandoc --metadata-file $HOME/.config/pandoc/default-metadata.yaml -f markdown "' . expand('%:p') . '" -t pdf --pdf-engine=xelatex -o "' . expand('%:p:r') . '.pdf"')<CR>]]
)
cmd([[autocmd FileType markdown,rmd nmap <buffer> <LocalLeader>i <CMD>call mdip#MarkdownClipboardImage()<CR>]])
map(
    "n",
    "<LocalLeader>t",
    '<CMD>lua require(\'truth_table\')(vim.fn.input("separator: "), vim.fn.input("left border: "), vim.fn.input("right border: "))<CR>',
    {}
)
cmd([[autocmd FileType text nmap <buffer> <LocalLeader>t <CMD>lua require('truth_table')(" ")<CR>]])
cmd(
    [[autocmd FileType markdown nmap <buffer> <LocalLeader>t <CMD>lua require('truth_table')(" <BAR> ", "<BAR> ", " <BAR>")<CR>]]
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

cmd([[autocmd FileType markdown inoremap <S-CR> <CR><CR>---<CR><CR>]])

cmd([[autocmd BufNewFile markdown,rmd call nvim_put(["# " .. expand("%:r")], "c", v:false, v:true)]])

vim.g.cursorhold_updatetime = 250
vim.o.foldmethod = "marker"
-- vim.o.foldmethod = "expr"
-- cmd([[set foldexpr=nvim_treesitter#foldexpr()]])
cmd([[set shortmess += "c"]])
vim.o.pumblend = 20
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

cmd([[autocmd FileType java set shiftwidth=4]])
cmd([[autocmd FileType markdown,rmd set softtabstop=1]])
cmd([[autocmd FileType java set softtabstop=4]])
cmd([[autocmd FileType python set colorcolumn=80]])
cmd([[autocmd FileType lua set colorcolumn=120]])

vim.lsp._on_attach = function(_, bufnr)
    local function buf_map(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local opts = { noremap = false, silent = true }

    buf_map("n", "gd", "<CMD>split | Telescope lsp_definitions<CR>", opts)
    buf_map("n", "gtd", "<CMD>split | Telescope lsp_type_definitions<CR>", opts)
    buf_map("n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_map("n", "gi", "<CMD>Telescope lsp_implementations<CR>", opts)
    buf_map("n", "gr", "<CMD>Telescope lsp_references<CR>", opts)
    buf_map("n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>", opts)
    buf_map("n", "<Leader>r", "<CMD>lua vim.lsp.buf.rename()<CR>", opts)
    buf_map("n", "<Leader>f", "<CMD>lua vim.lsp.buf.formatting()<CR>", opts)
    buf_map("n", "<Leader>F", "<CMD>Telescope lsp_code_actions<CR>", opts)
    buf_map("v", "<Leader>F", "<CMD>Telescope lsp_range_code_actions<CR>", opts)
    buf_map("n", "<Leader>N", "<CMD>lua vim.diagnostic.goto_prev()<CR>", opts)
    buf_map("n", "<Leader>n", "<CMD>lua vim.diagnostic.goto_next()<CR>", opts)

    vim.opt.signcolumn = "yes"

    vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float({ focusable=false })]])
    -- TODO: check if we're in a repository owned by someone else or a fork of a
    -- repository owned by someone else, and if we are, don't register this
    -- autocommand.
    vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)]])
end

vim.lsp._on_attach_no_fomatting = function(client, bufnr)
    vim.lsp._on_attach(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
end

local ok, res = pcall(require, "cmp_nvim_lsp")
if ok then
    vim.lsp._capabilities = res.update_capabilities(vim.lsp.protocol.make_client_capabilities())
end

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PackerBootstrap = fn.system({
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
        ft = { "markdown", "rmd" },
        config = function()
            vim.g.mkdp_highlight_css = os.getenv("HOME") .. "/.cache/wal/colors.css"
            vim.g.mkdp_page_title = "${name}.md"
            vim.g.mkdp_filetypes = { "markdown", "rmd" }
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
            vim.cmd([[autocmd FileType markdown,rmd nmap <buffer> <LocalLeader>h <Plug>MarkdownPreviewToggle]])
        end,
    })
    use("tpope/vim-sleuth")
    use("tpope/vim-surround")
    use("tpope/vim-fugitive")
    use("antoinemadec/FixCursorHold.nvim")
    use({
        "jalvesaq/Nvim-R",
        branch = "stable",
        cond = function()
            local buf_ext = vim.fn.expand("%:e")
            for _, ext in ipairs({ "Rmd", "rmd", "R", "r" }) do
                if buf_ext == ext then
                    return true
                end
            end
            return false
        end,
        run = function()
            os.execute()
        end,
        config = function()
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
                                return vim.o.ft == "markdown"
                            end,
                        },
                        "progress",
                    },
                },
            })
        end,
        after = "nvim-gps",
    })
    -- TODO: make my own version of this, use https://vi.stackexchange.com/questions/25996/write-register-0-to-file
    use({
        "ferrine/md-img-paste.vim",
        ft = { "markdown", "rmd" },
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
        ft = { "markdown", "rmd", "tex" },
        config = function()
            vim.g["pencil#conceallevel"] = 2
            vim.g["pencil#wrapModeDefault"] = "soft"
            vim.g["pencil#cursorwrap"] = 0
            vim.cmd([[autocmd FileType markdown,rmd,tex call pencil#init()]])
        end,
    })
    use({
        "dkarter/bullets.vim",
        config = function()
            vim.g.bullets_set_mappings = 0
            vim.g.bullets_outline_levels = { "ABC", "num", "std-" }
            vim.g.bullets_checkbox_markers = " ox"
            vim.g.bullets_renumber_on_change = 0
            vim.g.bullets_enabled_file_types = { "markdown", "rmd", "tex" }

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
    use({
        "nvim-telescope/telescope.nvim",
        config = function()
            ---@diagnostic disable-next-line: redefined-local
            local map = vim.api.nvim_set_keymap
            map("n", "tg", "<CMD>Telescope live_grep<CR>", {})
            map("n", "tf", "<CMD>Telescope find_files<CR>", {})
            map("n", "ty", "<CMD>Telescope filetypes<CR>", {})
            map("n", "tb", "<CMD>Telescope git_branches<CR>", {})
        end,
        requires = { "nvim-lua/plenary.nvim" },
    })
    use("mtoohey31/chafa.vim")
    use({
        "https://github.com/soywod/himalaya",
        rtp = "vim",
        cmd = "Himalaya",
        config = function()
            vim.cmd("source ~/.local/share/nvim/site/pack/packer/opt/himalaya/vim/plugin/himalaya.vim")

            vim.g.himalaya_mailbox_picker = "telescope"
            vim.g.himalaya_telescope_preview_enabled = true
        end,
    })
    use("othree/eregex.vim")
    use({
        "windwp/nvim-autopairs",
        config = function()
            -- TODO: set up smart pairs for markdown once I have a decent tree-sitter grammar
            -- include _, __, *, **, $, $$, `, ```
            -- exclude escaped versions and characters inside math or code scopes that shouldn't be valid there
            local pairs = require("nvim-autopairs")
            local Rule = require("nvim-autopairs.rule")
            local cond = require("nvim-autopairs.conds")
            pairs.setup({
                disable_filetype = { "TelescopePrompt" },
            })
            pairs.add_rule(Rule("<", ">", "rust"):with_pair(cond.not_before_regex_check("[%d ]")))
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
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = true },
                fold = { enable = true },
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
                -- TODO: add contexts for different markdown comments, and maybe contribute them if someone else hasn't already?
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
                    highlight_pair_events = {},
                    highlight_self = false,
                    goto_right_end = false,
                    fallback_cmd_normal = "call matchit#Match_wrapper('',1,'n')",
                    keymaps = {
                        goto_partner = "<leader>%",
                        delete_balanced = "X",
                    },
                    delete_balanced = {
                        only_on_first_char = false,
                        fallback_cmd_normal = nil,
                        longest_partner = false,
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
    use({
        "nvim-treesitter/nvim-tree-docs",
        requires = { "Olical/aniseed" },
        after = "nvim-treesitter",
        disable = true,
    })
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
            vim.cmd([[autocmd FileType markdown,rmd setlocal commentstring=<!--%s-->]])
        end,
        after = "nvim-treesitter",
    })
    use({
        "neovim/nvim-lspconfig",
        as = "lspconfig",
        config = function()
            local nvim_lsp = require("lspconfig")

            local servers = {
                "ansiblels",
                "bashls",
                "ccls",
                "cssls",
                "clojure_lsp",
                "dartls",
                "dockerls",
                "fsautocomplete",
                "gopls",
                "hls",
                "html",
                "kotlin_language_server",
                -- "ltex",
                "metals", -- if I use this much, I should add nvim-metals
                "pyright",
                "r_language_server",
                "solargraph",
                "solidity_ls",
                "svelte",
                "tailwindcss",
                "taplo",
                "vimls",
                "zls",
            }

            for _, ls in ipairs(servers) do
                nvim_lsp[ls].setup({
                    on_attach = vim.lsp._on_attach,
                    flags = {
                        debounce_text_changes = 150,
                    },
                    capabilities = vim.lsp._capabilities,
                })
            end

            local manually_enabled_servers = {
                "grammarly",
            }

            for _, ls in ipairs(manually_enabled_servers) do
                nvim_lsp[ls].setup({
                    on_attach = vim.lsp._on_attach,
                    flags = {
                        debounce_text_changes = 150,
                    },
                    capabilities = vim.lsp._capabilities,
                    autostart = false,
                })
            end

            local servers_no_fomatting = {
                "erlangls",
                "jsonls",
                "tsserver",
                "rls",
            }

            for _, ls in ipairs(servers_no_fomatting) do
                nvim_lsp[ls].setup({
                    on_attach = vim.lsp._on_attach_no_fomatting,
                    flags = {
                        debounce_text_changes = 150,
                    },
                    capabilities = vim.lsp._capabilities,
                })
            end

            nvim_lsp.emmet_ls.setup({
                filetypes = {
                    "html",
                    "css",
                    "svelte",
                    "typescriptreact",
                    "javascriptreact",
                    "vue",
                    "scss",
                    "less",
                },
                on_attach = vim.lsp._on_attach,
                flags = {
                    debounce_text_changes = 150,
                },
                capabilities = vim.lsp._capabilities,
            })

            nvim_lsp.java_language_server.setup({
                cmd = { "java-language-server" },
                on_attach = vim.lsp._on_attach_no_fomatting,
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
                capabilities = vim.lsp._capabilities,
            })

            nvim_lsp.omnisharp.setup({
                cmd = { "/usr/bin/omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
                on_attach = vim.lsp._on_attach,
                flags = {
                    debounce_text_changes = 150,
                },
                capabilities = vim.lsp._capabilities,
            })

            local runtime_path = vim.split(package.path, ";")
            table.insert(runtime_path, "lua/?.lua")
            table.insert(runtime_path, "lua/?/init.lua")

            nvim_lsp.sumneko_lua.setup({
                cmd = { "/usr/bin/lua-language-server", "-E", "/usr/share/lua-language-server/main.lua" },
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
                on_attach = vim.lsp._on_attach,
                capabilities = vim.lsp._capabilities,
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
                on_attach = vim.lsp._on_attach,
                flags = {
                    debounce_text_changes = 150,
                },
                capabilities = vim.lsp._capabilities,
            })

            nvim_lsp.yamlls.setup({
                on_attach = vim.lsp._on_attach,
                flags = {
                    debounce_text_changes = 150,
                },
                settings = {
                    yaml = {
                        schemas = {
                            ["https://raw.githubusercontent.com/mtoohey31/yams/master/schema.yaml"] = "recipes/**/*.yaml",
                            ["https://json.schemastore.org/github-workflow.json"] = "**/.github/workflows/*.yaml",
                            ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "/docker-compose*.yaml",
                        },
                    },
                },

                capabilities = vim.lsp._capabilities,
            })

            require("rust-tools").setup({
                tools = {
                    hover_actions = { border = "none" },
                    runnables = { use_telescope = true },
                    debuggables = { use_telescope = true },
                },
                server = {
                    on_attach = vim.lsp._on_attach,
                    flags = { debounce_text_changes = 150, capabilities = vim.lsp._capabilities },
                },
            })

            local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

            for type, icon in pairs(signs) do
                local hl = "LspDiagnosticsSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end

            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                underline = true,
                update_in_insert = true,
            })
        end,
        after = { "cmp-nvim-lsp", "rust-tools.nvim" },
    })
    use("hrsh7th/cmp-nvim-lsp")
    use({
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["UltiSnips#Anon"](args.body)
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
                experimental = { ghost_text = true },
            })
        end,
        after = { "ultisnips" },
    })
    use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
    -- " TODO: make this work without a prefixed `./`
    use("hrsh7th/cmp-path")
    use({ "f3fora/cmp-nuspell", rocks = "lua-nuspell" })
    -- " TODO: make this work for tex math
    use("hrsh7th/cmp-calc")
    use("hrsh7th/cmp-emoji")
    -- " TODO: Consider the alternatives to this that are also supported by nvim-cmp
    use("SirVer/ultisnips")
    use("quangnguyen30192/cmp-nvim-ultisnips")
    use({ "mtoohey31/cmp-fish", ft = "fish" })

    -- TODO: get tab working beautifully, including in markdown
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
        rocks = "lua-nuspell",
        requires = "mtoohey31/null-ls-typo-fix",
        config = function()
            local null_ls = require("null-ls")
            local builtins = null_ls.builtins
            local diagnostics = builtins.diagnostics
            local formatting = builtins.formatting

            null_ls.setup({
                sources = {
                    require("typo_fix").setup("en_GB"),
                    diagnostics.cspell.with({
                        filetypes = { "markdown", "rmd" },
                        extra_args = { "--config", os.getenv("HOME") .. "/.config/nvim/cspell.yaml" },
                    }),
                    diagnostics.hadolint,
                    diagnostics.markdownlint.with({
                        filetypes = { "markdown" },
                        extra_args = {
                            "-c",
                            os.getenv("HOME") .. "/.config/nvim/markdownlint.yaml",
                            "--stdin",
                        },
                    }),
                    diagnostics.shellcheck,

                    formatting.autopep8,
                    formatting.fish_indent,
                    formatting.google_java_format.with({ extra_args = { "--aosp" } }),
                    formatting.markdownlint.with({ filetypes = { "markdown" } }),
                    formatting.prettierd.with({
                        filetypes = {
                            "javascript",
                            "javascriptreact",
                            "typescript",
                            "typescriptreact",
                            "vue",
                            "css",
                            "scss",
                            "less",
                            "html",
                            "json",
                            "yaml",
                            "markdown",
                            "graphql",
                            -- "svelte",
                        },
                    }),
                    formatting.stylua.with({
                        extra_args = function(params)
                            return {
                                "--indent-type",
                                "spaces",
                                "--indent-width",
                                vim.api.nvim_buf_get_option(params.bufnr, "shiftwidth"),
                            }
                        end,
                    }),
                },
                on_attach = vim.lsp._on_attach,
                capabilities = vim.lsp._capabilities,
            })
        end,
        after = { "cmp-nvim-lsp" },
    })
    -- TODO: set this up to use the root of the current git directory
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
                vim.api.nvim_set_keymap("n", "tt", "<CMD>TroubleToggle<CR>", {}),
                vim.api.nvim_set_keymap("n", "td", "<CMD>TodoTrouble<CR>", {}),
            })
        end,
    })
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
            require("package-info").setup()
        end,
    })
    -- TODO: set up cmp for this
    use({
        "Saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("crates").setup()
        end,
    })
    use("editorconfig/editorconfig-vim")
    -- TODO: configure this
    use("ThePrimeagen/git-worktree.nvim")
    -- TODO: set up dap integration for this when I add it
    use({
        "simrat39/rust-tools.nvim",
        requires = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    })
    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            -- TODO: set up pywal based rainbow guides
            require("indent_blankline").setup({ filetype_exclude = { "octo" } })
        end,
    })
    -- use({
    --     "edluffy/hologram.nvim",
    --     config = function()
    --         require("hologram").setup()
    --     end,
    -- })
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup({
                pre_hook = function(ctx)
                    local U = require("Comment.utils")

                    local location = nil
                    if ctx.ctype == U.ctype.block then
                        location = require("ts_context_commentstring.utils").get_cursor_location()
                    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
                        location = require("ts_context_commentstring.utils").get_visual_start_location()
                    end

                    return require("ts_context_commentstring.internal").calculate_commentstring({
                        key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
                        location = location,
                    })
                end,
            })
        end,
        after = "nvim-ts-context-commentstring",
    })

    if PackerBootstrap then
        require("packer").sync()
    end
end)

cmd([[autocmd BufWinEnter,WinEnter term://* startinsert]])
cmd([[autocmd TermOpen * setlocal nonumber norelativenumber]])
cmd(
    [[autocmd BufRead * if !empty($LF_LEVEL) | call system('lf -remote "send $id cd ' .. expand('%:p:h') .. '" && lf -remote "send $id select ' .. expand('%') .. '"') | endif]]
)
cmd([[autocmd BufNewFile,BufRead *.S set ft=asm]])
