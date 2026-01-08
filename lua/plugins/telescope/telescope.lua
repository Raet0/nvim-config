return {
    'nvim-telescope/telescope.nvim',
    tag = 'v0.2.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        -- Buscador de archivos (Find Files)
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Buscar archivos" },
        -- Buscar texto en todo el proyecto (Live Grep) - Requiere ripgrep instalado
        { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Buscar texto (grep)" },
        -- Buscar entre archivos abiertos (Buffers)
        { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Ver buffers abiertos" },
        -- Ayuda de Neovim (Help Tags)
        { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Buscar en la ayuda" },
        -- Archivos recientes (Old Files)
        { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Archivos recientes" },
        -- Símbolos del LSP (Funciones, Variables en el archivo actual)
        { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Símbolos del documento" },
    },
    opts = {
        defaults = {
            prompt_prefix = "   ",
            selection_caret = " ",
            entry_prefix = " ",
            sorting_strategy = "ascending",
            layout_config = {
                horizontal = {
                    prompt_position = "top",
                    preview_width = 0.55,
                },
                width = 0.87,
                height = 0.80,
            },
            mappings = {
                n = {
                    ["q"] = function(...)
                        return require("telescope.actions").close(...)
                    end,
                },
            },
        },
    },
}
