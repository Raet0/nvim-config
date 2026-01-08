return {
  -- No incluimos 'cmd' ni 'filetypes' porque Neovim 0.11 ya los conoce por defecto
  
  init_options = {
    -- Permite que el LSP formatee el código (puedes usar :vim.lsp.buf.format())
    provideFormatter = true,
    
    -- VITAL: Esto permite que el autocompletado funcione dentro de etiquetas <style> y <script>
    embeddedLanguages = { 
      css = true, 
      javascript = true 
    },
    
    -- Configuración para que el servidor sepa qué secciones analizar
    configurationSection = { 'html', 'css', 'javascript' },
  },

  settings = {
    html = {
      format = {
        templating = true,
        wrapLineLength = 120,
        wrapAttributes = 'auto',
      },
      hover = {
        documentation = true,
        references = true,
      },
    },
  },
}
