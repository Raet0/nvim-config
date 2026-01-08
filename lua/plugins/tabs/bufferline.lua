return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy", -- Carga optimizada
    keys = {
        -- 1. CICLO DE BUFFERS (Tab y Shift-Tab)
        { "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Siguiente Buffer" },
        { "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Buffer Anterior" },
        -- 2. CERRAR VENTANA (Alt + Shift + W)
        -- En Neovim, <M- es la tecla Alt (Meta). La W mayúscula implica Shift.
        { "<M-W>", "<cmd>bd<cr>", desc = "Cerrar pestaña" }
    },
    opts = {
        options = {
            -- 1. CORRECCIÓN DE COMANDOS (Sin depender de 'Snacks')
            close_command = "bd %d",       -- Al cerrar con el botón X
            right_mouse_command = "bd %d", -- Al cerrar con click derecho
            -- 2. DIAGNÓSTICOS PERSISTENTES (Adaptado para no usar LazyVim.config)
            diagnostics = "nvim_lsp",
            always_show_bufferline = true, -- Tú pediste que siempre se vea
            diagnostics_indicator = function(count, level, diag)
                -- Usamos iconos estándar para evitar errores de conversión en WSL
                local icons = { Error = " ", Warn = " ", Hint = "󰌵 ", Info = " " }
                local ret = (diag.error and icons.Error .. diag.error .. " " or "")
                .. (diag.warning and icons.Warn .. diag.warning or "")
                return vim.trim(ret)
            end,

            -- 3. ESTÉTICA RECTANGULAR Y BOTÓN X (Tus requisitos)
            separator_style = "thin",       -- Aspecto rectangular plano
            enforce_regular_tabs = true,   -- Tamaño uniforme
            show_buffer_close_icons = true, -- La X que pediste
            show_close_icon = false,       -- Desactiva la X global al final de la barra

            -- 4. OFFSET PARA NVIM-TREE (Corregido de 'neo-tree' a 'nvim-tree')
            offsets = {
                {
                    filetype = "nvim-tree",
                    text = "FILE EXPLORER",
                    highlight = "Directory",
                    text_align = "left",
                    separator = true,
                },
            },
        },
    },
}
