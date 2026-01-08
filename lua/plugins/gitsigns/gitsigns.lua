return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" }, -- Carga el plugin solo cuando abres un archivo
  opts = {
    -- Solo definimos lo que queremos cambiar o asegurar
    signs = {
      add          = { text = "┃" },
      change       = { text = "┃" },
      delete       = { text = "_" },
      topdelete    = { text = "‾" },
      changedelete = { text = "~" },
      untracked    = { text = "┆" },
    },
    signcolumn = true,  -- Mostrar la columna de signos
    numhl      = false, -- Resaltar número de línea (opcional)
    linehl     = false, -- Resaltar la línea completa (opcional)
    word_diff  = false,
    current_line_blame = true, -- Te muestra quién hizo el cambio en la línea actual
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol", -- Al final de la línea
      delay = 500,           -- Medio segundo para que aparezca el nombre
    },
  },
}
