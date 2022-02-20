local nvim_lsp = require("lspconfig")

local servers = {
    "ansiblels",
    "bashls",
    "ccls",
    "cssls",
    "dartls",
    "dockerls",
    "gopls",
    "hls",
    "kotlin_language_server",
    "r_language_server",
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
        offset_encoding = "utf-16",
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
        offset_encoding = "utf-16",
        autostart = false,
    })
end

local servers_no_fomatting = {
    "html",
    "jsonls",
    "pyright",
    "tsserver",
    "rls",
    "svelte",
}

for _, ls in ipairs(servers_no_fomatting) do
    nvim_lsp[ls].setup({
        on_attach = vim.lsp._on_attach_no_fomatting,
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = vim.lsp._capabilities,
        offset_encoding = "utf-16",
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
    offset_encoding = "utf-16",
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
    offset_encoding = "utf-16",
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
    on_attach = vim.lsp._on_attach_no_fomatting,
    capabilities = vim.lsp._capabilities,
    offset_encoding = "utf-16",
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
    offset_encoding = "utf-16",
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
    offset_encoding = "utf-16",
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
