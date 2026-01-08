return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "saghen/blink.cmp"
    },
    config = function()
        local blink = require("blink.cmp")

        -- 1. Estética de Diagnósticos
        local signs = { Error = " ", Warn = " ", Hint = "󰌵 ", Info = " " }
        vim.diagnostic.config({
            virtual_text = { current_line = true, prefix = "●" },
            severity_sort = true,
            float = { border = "rounded", source = "always" },
            -- VINCULACIÓN DE ICONOS: Vital para que aparezcan en el lateral
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = signs.Error,
                    [vim.diagnostic.severity.WARN] = signs.Warn,
                    [vim.diagnostic.severity.HINT] = signs.Hint,
                    [vim.diagnostic.severity.INFO] = signs.Info,
                },
            },
        })
        -- 2. Servidores para tu entorno idóneo
        local servers = { "pyright", "bashls", "cssls", "html", "lua_ls", "ts_ls", "jdtls" }

        -- 3. Bucle de activación Nativa
        for _, server in ipairs(servers) do
            local ok, server_opts = pcall(require, "lsp." .. server)
            if not ok or type(server_opts) ~= "table" then
                server_opts = {}
            end

            -- Inyectar capacidades de Blink.cmp para autocompletado instantáneo
            server_opts.capabilities = blink.get_lsp_capabilities(server_opts.capabilities)

            -- Registro Nativo Neovim 0.11
            vim.lsp.config(server, server_opts)
            vim.lsp.enable(server)
        end
    end,

}
