-- Función auxiliar para cambiar el path de Python dinámicamente (útil para Venv en WSL)
local function set_python_path(command)
  local path = command.args
  local clients = vim.lsp.get_clients { bufnr = vim.api.nvim_get_current_buf(), name = 'pyright' }
  for _, client in ipairs(clients) do
    if client.settings then
      client.settings.python = vim.tbl_deep_extend('force', client.settings.python or {}, { pythonPath = path })
    end
    client:notify('workspace/didChangeConfiguration', { settings = nil })
  end
end

return {
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'openFilesOnly', -- Mejora el rendimiento al no analizar archivos cerrados
        typeCheckingMode = 'basic',      -- Cambia a 'strict' si quieres un tipado muy rígido
      },
    },
  },
  on_attach = function(client, bufnr)
    -- Comando: :LspPyrightOrganizeImports (Limpia tus archivos de Angular/Python)
    vim.api.nvim_buf_create_user_command(bufnr, 'LspPyrightOrganizeImports', function()
      local params = {
        command = 'pyright.organizeimports',
        arguments = { vim.uri_from_bufnr(bufnr) },
      }
      client.request('workspace/executeCommand', params, nil, bufnr)
    end, { desc = 'Organize Imports' })

    -- Comando: :LspPyrightSetPythonPath (Selecciona tu venv manualmente)
    vim.api.nvim_buf_create_user_command(bufnr, 'LspPyrightSetPythonPath', set_python_path, {
      desc = 'Reconfigure pyright with the provided python path',
      nargs = 1,
      complete = 'file',
    })
  end,
}
