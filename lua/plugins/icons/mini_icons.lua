return {
  "echasnovski/mini.icons",
  opts = {
    style = "glyph", -- Usa Nerd Font
    -- Solo añade esto si necesitas personalizaciones específicas
    file = {},
    directory = {},
  },
  config = function(_, opts)
    require("mini.icons").setup(opts)
    -- LÍNEA VITAL: Activa el modo compatibilidad
    require("mini.icons").mock_nvim_web_devicons()
  end,
}
