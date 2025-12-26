local opt = vim.opt

-- numeros 
opt.number = true
opt.relativenumber = true
-- espaciados
opt.tabstop = 4             -- Ancho visual de un tabulador
opt.shiftwidth = 4          -- Espacios usados en cada nivel de sangría (indent)
opt.expandtab = true        -- Convierte los tabuladores en espacios
opt.smartindent = true      -- Indentación automática inteligente al programar
-- interfaz y comportamiento
opt.scrolloff = 8           -- Mantiene 8 líneas visibles arriba/abajo al hacer scroll
opt.cursorline = true       -- Resalta la línea donde está el cursor
opt.termguicolors = true    -- Colores reales para que tus temas se vean bien
opt.wrap = false            -- No corta las líneas largas (puedes activarlo con true)
opt.mouse = "a"             -- Permite usar el mouse
