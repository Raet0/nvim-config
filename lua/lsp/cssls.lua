return {
  -- No incluimos 'capabilities' aquí porque tu lsp.lua ya usa blink.get_lsp_capabilities()
  
  settings = {
    css = { validate = true },
    scss = { validate = true }, -- Útil si usas preprocesadores en Angular
    less = { validate = true },
  },

  init_options = {
    -- Habilita el formateo nativo para usar con :lua vim.lsp.buf.format()
    provideFormatter = true,
  },
}
