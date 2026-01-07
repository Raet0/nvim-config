return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },  -- Abre archivos grandes sin lag
    notifier = { enabled = true }, -- Activa notificaciones bonitas
    quickfile = { enabled = true }, -- Aceleración de lectura de archivos
    statuscolumn = { enabled = true }, -- Mejora la columna de números
    words = { enabled = true }, -- Resalta palabras iguales (LSP)
  },
}
