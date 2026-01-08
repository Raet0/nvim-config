-- Función para determinar dónde guardar los datos temporales de Java en WSL
local function get_jdtls_data_dir(root_dir)
  local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
  return vim.fn.stdpath("cache") .. "/jdtls/workspace/" .. project_name
end

-- Marcadores para detectar que estamos en un proyecto Java (Maven, Gradle, Git)
local root_markers = { "mvnw", "gradlew", "pom.xml", "build.gradle", ".git" }

return {
  -- El comando se genera dinámicamente para incluir el directorio de datos
  cmd = function(dispatchers, config)
    local root_dir = config.root_dir or vim.fn.getcwd()
    local data_dir = get_jdtls_data_dir(root_dir)

    local cmd = {
      "jdtls",
      "-data", data_dir,
      -- Si usas Lombok, aquí podrías añadir el --jvm-arg
    }

    return vim.lsp.rpc.start(cmd, dispatchers, {
      cwd = config.cmd_cwd,
      env = config.cmd_env,
    })
  end,

  filetypes = { "java" },
  
  -- Usamos la función nativa de 0.11 para encontrar la raíz del proyecto
  root_dir = function(fname)
    return vim.fs.root(fname, root_markers)
  end,

  settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" },
      completion = {
        favoriteStaticMembers = {
          "org.junit.Assert.*",
          "org.junit.jupiter.api.Assertions.*",
          "org.mockito.Mockito.*",
        },
      },
    },
  },
}
