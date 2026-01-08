return {
  -- No necesitamos 'cmd' ni 'filetypes' porque Neovim 0.11 ya los conoce

  settings = {
    bashIde = {
      -- VITAL: Evita que el servidor escanee recursivamente carpetas gigantes (como tu HOME)
      -- El patrón '*@(.sh|.inc|.bash|.command)' solo busca en el directorio actual.
      globPattern = vim.env.GLOB_PATTERN or '*@(.sh|.inc|.bash|.command)',
    },
  },

  -- Marcadores de raíz para que el servidor sepa dónde empieza tu proyecto de scripts
  root_markers = { ".git", ".bashrc", "package.json" },
}
