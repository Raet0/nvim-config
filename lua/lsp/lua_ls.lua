return {
  -- El bloque on_init hace que el LSP reconozca automáticamente las funciones de Neovim
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      -- Si ya tienes un archivo de configuración de Lua (.luarc.json), el LSP lo respetará
      if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
        return
      end
    end

    -- Configuración dinámica para desarrollo de Neovim
    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = { version = 'LuaJIT' },
      workspace = {
        checkThirdParty = false,
        -- Esto le dice al LSP dónde están los archivos internos de Neovim
        library = { vim.env.VIMRUNTIME }
      }
    })
  end,

  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }, -- Evita el aviso de "global indefinida vim"
      },
      hint = { 
        enable = true, -- Activa los Inlay Hints nativos que querías
        semicolon = 'Disable' 
      },
      telemetry = { enable = false }, -- Privacidad: no envía datos de uso
    },
  },
}
