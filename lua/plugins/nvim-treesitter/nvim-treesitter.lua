return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    -- Usamos un evento para que no cargue en la pantalla de inicio, sino al abrir archivos
    event = { "BufReadPost", "BufNewFile" }, 
    config = function()
        -- SOLUCIÓN AL ERROR: Verificamos que el módulo exista antes de llamarlo
        local status_ok, configs = pcall(require, "nvim-treesitter.configs")
        if not status_ok then 
            return 
        end

        configs.setup({
            -- Habilitar resaltado tipo VS Code
            highlight = { 
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            -- Habilitar indentación inteligente
            indent = { enable = true },
            -- Lista de lenguajes a instalar automáticamente
            ensure_installed = {
                "lua", "luadoc", "bash", "c", "html", "javascript", 
                "json", "python", "typescript", "tsx", "vim", "vimdoc", 
                "markdown", "markdown_inline", "yaml", "regex"
            },
        })
    end,
}
