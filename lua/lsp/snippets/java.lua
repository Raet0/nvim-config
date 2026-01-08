local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Función para calcular el package basado en la ruta del archivo
local function get_package_name()
    local path = vim.fn.expand("%:p:h") -- Obtiene la ruta de la carpeta actual
    -- Busca la carpeta 'src/main/java/' o 'src/' para determinar el inicio del paquete
    local _, match_end = string.find(path, "src/main/java/")
    if not match_end then
        _, match_end = string.find(path, "src/")
    end

    if match_end then
        local package_path = string.sub(path, match_end + 1)
        return string.gsub(package_path, "/", ".") -- Cambia / por .
    end
    return "default_package"
end

-- Función para obtener el nombre del archivo (para el nombre de la clase)
local function get_class_name()
    return vim.fn.expand("%:t:r")
end

return {
    -- Snippet para Clase Normal
    s("pclass", {
        t("package "), f(get_package_name), t({ ";", "", "", "public class " }),
        f(get_class_name), t({ " {", "\t" }), i(0), t({ "", "}" })
    }),

    -- Snippet para Clase con Main (Todo en uno)
    s("pmain", {
        t("package "), f(get_package_name), t({ ";", "", "", "public class " }),
        f(get_class_name), t({ " {", "", "\tpublic static void main(String[] args) {", "\t\t" }),
        i(0),
        t({ "", "\t}", "}" })
    }),
}
