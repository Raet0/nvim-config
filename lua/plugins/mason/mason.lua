return {
    {
        "williamboman/mason.nvim",
        opts = {
            ui = { border = "rounded" },
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = {
            ensure_installed = {
                "lua_ls",    -- Lua
                "pyright",   -- Python
                "ts_ls",     -- JS/TS
                "html",      -- HTML
                "cssls",     -- CSS
                "bashls",    -- Bash
                "jdtls",     -- Java (Servidor básico)
            },
        },
    },
}
