return {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
        local luasnip = require("luasnip")
        -- 1. Cargar snippets de VS Code (requiere friendly-snippets)
        require("luasnip.loaders.from_vscode").lazy_load()
        -- 2. Cargar formatos adicionales (SnipMate y Lua)
        require("luasnip.loaders.from_snipmate").lazy_load()
        require("luasnip.loaders.from_lua").lazy_load()
        require("luasnip").add_snippets("java", require("lsp.snippets.java"))
        -- 3. Aplicar el fix de InsertLeave que mencionaste
        vim.api.nvim_create_autocmd("InsertLeave", {
            callback = function()
                if luasnip.session.current_nodes[vim.api.nvim_get_current_buf()]
                    and not luasnip.session.jump_active
                    then
                        luasnip.unlink_current()
                    end
                end,
            })
        end,
    }
