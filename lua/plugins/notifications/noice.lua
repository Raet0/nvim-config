return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    -- Usamos nvim-notify para notificaciones visuales estilo VS Code
    "rcarriga/nvim-notify",
  },
  opts = {
    lsp = {
      -- Sobrescribir el renderizado de markdown para que cmp y otros usen Treesitter
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    -- Ajustes recomendados para una interfaz limpia
    presets = {
      bottom_search = true,         -- Barra de búsqueda clásica abajo
      command_palette = true,       -- Une la línea de comandos y el menú popup
      long_message_to_split = true, -- Mensajes largos se van a un split
      inc_rename = false,           -- Desactivado si no usas inc-rename.nvim
      lsp_doc_border = false,       -- Sin borde en documentación flotante
    },
  },
}
