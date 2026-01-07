return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    -- Usamos 'opts' para que lazy.nvim llame a setup(opts) automáticamente
    opts = {
        enabled = function(bufnr) return true end,
        -- Añadimos 'TelescopePrompt' y 'snacks_picker_input' para evitar errores en buscadores
        disable_filetype = { "TelescopePrompt", "spectre_panel", "snacks_picker_input" },
        disable_in_macro = true,
        disable_in_visualblock = false,
        disable_in_replace_mode = true,
        -- Expresión regular para no insertar pares si hay ciertos caracteres delante
        ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
        enable_moveright = true,
        enable_afterquote = true, 
        enable_check_bracket_line = true,
        enable_bracket_in_quote = true,
        enable_abbr = false,
        break_undo = true,
        check_ts = false, -- Cambiar a true si usas Treesitter para mayor precisión
        map_cr = true,
        map_bs = true,
        map_c_h = false,
        map_c_w = false,
    }
}
