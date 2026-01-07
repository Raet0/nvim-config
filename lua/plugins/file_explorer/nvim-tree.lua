return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        -- 1. Corregida la URL del autor
        "echasnovski/mini.icons",
    },
    keys = {
        { "<C-e>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle Explorador" },
    },
    config = function()
        -- 2. Inicializar mini.icons primero
        local icons = require("mini.icons")
        icons.setup()
        
        -- 3. Crear el "mock" para que nvim-tree lo reconozca
        icons.mock_nvim_web_devicons()

        -- 4. Configurar nvim-tree
        require("nvim-tree").setup({
            view = {
                side = "right", -- Lo moviste a la derecha según tu código
                width = 30,
            },
            renderer = {
                -- Esto asegura que se intenten dibujar los iconos
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
