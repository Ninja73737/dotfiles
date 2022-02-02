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
packer.init({
    enable = true,
    threshold = 0,
})

local use = packer.use
packer.reset()

local fuse = function(plugin_spec)
    if type(plugin_spec) == "string" then
        plugin_spec = { plugin_spec }
    end
    local name = fn.split(fn.split(plugin_spec[1], "/")[2], "\\.")[1]:lower()
    if name:sub(1, 5) == "nvim-" then
        name = name:sub(6)
    elseif name:sub(1, 4) == "vim-" then
        name = name:sub(5)
    end
    local config_path = fn.fnamemodify(os.getenv("MYVIMRC"), ":h") .. "/lua/config/" .. name .. ".lua"
    if fn.filereadable(config_path) == 1 then
        plugin_spec.config = string.format('require("config/%s")', name)
    end
    local setup_path = fn.fnamemodify(os.getenv("MYVIMRC"), ":h") .. "/lua/setup/" .. name .. ".lua"
    if fn.filereadable(setup_path) == 1 then
        plugin_spec.setup = string.format('require("setup/%s")', name)
    end
    use(plugin_spec)
end

fuse("wbthomason/packer.nvim")
fuse({ "sheerun/vim-polyglot" })
fuse({ "leafOfTree/vim-svelte-plugin", ft = "svelte" })
fuse({ "iamcco/markdown-preview.nvim", run = "call mkdp#util#install()", ft = { "markdown", "rmd" } })
fuse("tpope/vim-sleuth")
fuse("tpope/vim-surround")
fuse("tpope/vim-fugitive")
fuse("antoinemadec/FixCursorHold.nvim")
fuse({
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
})
fuse({ "mbbill/undotree" })
fuse({ "phaazon/hop.nvim" })
fuse("chaoren/vim-wordmotion")
fuse({ "nvim-lualine/lualine.nvim", after = "nvim-gps" })
fuse({ "ekickx/clipboard-image.nvim", ft = { "markdown", "rmd" } })
fuse({ "reedes/vim-pencil", ft = { "markdown", "rmd", "tex" } })
fuse({ "dkarter/bullets.vim" })
fuse("mg979/vim-visual-multi")
fuse({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
fuse({ "mtoohey31/tgc_wal.vim" })
fuse({ "norcalli/nvim-colorizer.lua" })
fuse({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
fuse("mtoohey31/chafa.vim")
fuse({ "soywod/himalaya", rtp = "vim", cmd = "Himalaya" })
fuse("othree/eregex.vim")
fuse({ "windwp/nvim-autopairs" })
fuse({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
fuse({ "nvim-treesitter/playground", after = "nvim-treesitter" })
fuse({ "theHamsta/nvim-treesitter-pairs", after = "nvim-treesitter" })
-- TODO: replce this with: https://github.com/danymat/neogen
fuse({
    "nvim-treesitter/nvim-tree-docs",
    requires = { "Olical/aniseed" },
    after = "nvim-treesitter",
    disable = true,
})
fuse({ "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" })
fuse({ "p00f/nvim-ts-rainbow", after = "nvim-treesitter" })
fuse({ "SmiteshP/nvim-gps", after = "nvim-treesitter" })
fuse({ "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" })
fuse({ "neovim/nvim-lspconfig", as = "lspconfig", after = { "cmp-nvim-lsp" } })
fuse("hrsh7th/cmp-nvim-lsp")
fuse({ "hrsh7th/nvim-cmp", after = { "LuaSnip" } })
fuse({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
-- " TODO: make this work without a prefixed `./`
fuse("hrsh7th/cmp-path")
-- TODO: make this work for tex math
fuse("hrsh7th/cmp-calc")
fuse("hrsh7th/cmp-emoji")
fuse({ "L3MON4D3/LuaSnip" })
fuse("rafamadriz/friendly-snippets")
fuse("saadparwaiz1/cmp_luasnip")
fuse({ "mtoohey31/cmp-fish", ft = "fish" })
-- " TODO: Fix this after completion changes
-- " Plug 'cbarrete/completion-vcard'
fuse({ "jose-elias-alvarez/null-ls.nvim", after = { "cmp-nvim-lsp", "lspconfig" } })
-- TODO: set this up to use the root of the current git directory
fuse({ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" })
fuse({ "folke/trouble.nvim" })
fuse({ "pwntester/octo.nvim" })
fuse({ "vuki656/package-info.nvim", requires = "MunifTanjim/nui.nvim" })
-- TODO: set up cmp for this
fuse({ "Saecki/crates.nvim", event = { "BufRead Cargo.toml" }, requires = "nvim-lua/plenary.nvim" })
fuse("editorconfig/editorconfig-vim")
-- TODO: configure this
fuse("ThePrimeagen/git-worktree.nvim")
-- TODO: set up dap integration for this when I add it
-- TODO: fix this
fuse({ "simrat39/rust-tools.nvim", after = { "lspconfig" }, requires = { "nvim-lua/plenary.nvim" } })
fuse({ "lukas-reineke/indent-blankline.nvim" })
-- TODO: set this up
-- fuse({
--     "edluffy/hologram.nvim",
--     config = function()
--         require("hologram").setup()
--     end,
-- })
fuse({ "numToStr/Comment.nvim", after = "nvim-ts-context-commentstring" })

if PackerBootstrap then
    require("packer").sync()
end
