return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy", -- Carga optimizada
  keys = {
    -- Mantenemos tus atajos pero con la lógica de desplazamiento de LazyVim
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "<leader>x", "<cmd>bd<cr>", desc = "Cerrar pestaña" },
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
