return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        local status_ok, configs = pcall(require, "nvim-treesitter.configs")
        if not status_ok then return end

        configs.setup({
            -- 1. Resaltado (Correcto: mantén regex en false para rendimiento)
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },

            -- 2. Indentación (Vital para Python y Java)
            indent = { enable = true },

            -- 3. SELECCIÓN INCREMENTAL (Nivel Pro)
            -- Uso: Presiona 'Enter' para seleccionar un bloque, 'Backspace' para reducirlo
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<CR>",
                    node_incremental = "<CR>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },

            -- 4. Lista Completa para tu Stack
            ensure_installed = {
                "lua", "bash", "python", "java",        -- Backend y Scripts
                "javascript", "typescript", "tsx",      -- Frontend
                "html", "css", "scss", "json", "yaml",  -- Web y Config
                "markdown", "markdown_inline", "vim", "vimdoc", "regex"
            },
        })
    end,
}
