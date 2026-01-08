return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "echasnovski/mini.icons",
    },
    keys = {
        { "<C-e>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle Explorador" }, 
    },
    config = function()
        local icons = require("mini.icons")
        icons.setup()
        icons.mock_nvim_web_devicons()

        require("nvim-tree").setup({
            -- 1. ACTIVAR DIAGNÓSTICOS (Estilo VS Code)
            diagnostics = {
                enable = true,
                show_on_dirs = true, -- Muestra el error también en la carpeta raíz
                show_on_open_dirs = false,
                debounce_delay = 50,
                severity = {
                    min = vim.diagnostic.severity.HINT, -- Muestra desde sugerencias hasta errores
                    max = vim.diagnostic.severity.ERROR,
                },
                icons = {
                    hint = "󰌵",
                    info = "",
                    warning = "",
                    error = "",
                },
            },
            view = {
                side = "right",
                width = 30,
            },
            renderer = {
                icons = {
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = true,
                        git = true,
                    },
                },
            },
        })
    end,
}
