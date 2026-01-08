return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'echasnovski/mini.icons' },
    config = function()
        -- Función personalizada para mostrar el servidor LSP activo
        local function lsp_status()
            local msg = 'No LSP'
            local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
            local clients = vim.lsp.get_clients({ bufnr = 0 })
            if next(clients) == nil then return msg end
            for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    return client.name
                end
            end
            return msg
        end

        require('lualine').setup({
            options = {
                theme = 'auto',
                -- Sincronizamos los iconos con tu lsp.lua y nvim-tree
                component_separators = { left = '｜', right = '｜' },
                section_separators = { left = '', right = '' },
                globalstatus = true,
                disabled_filetypes = { statusline = { 'dashboard', 'alpha', 'snacks_dashboard' } },
            },
            sections = {
                lualine_a = { { 'mode', separator = { left = '', right = '' }, right_padding = 2 } },
                lualine_b = { 
                    { 'branch', icon = '' }, 
                    { 'diff', symbols = { added = ' ', modified = '󰝤 ', removed = ' ' } } 
                },
                lualine_c = { 
                    { 'filename', path = 1, symbols = { modified = ' ●', readonly = ' 󰌾', unnamed = '[Sin nombre]' } },
                },
                lualine_x = {
                    -- Monitor de Diagnósticos con tus iconos corregidos
                    { 'diagnostics', symbols = { error = ' ', warn = ' ', info = ' ', hint = '󰌵 ' } },
                    { lsp_status, icon = ' LSP:', color = { fg = '#ffffff', gui = 'bold' } },
                    'encoding', 
                    'filetype'
                },
                lualine_y = { 'progress' },
                lualine_z = { { 'location', separator = { right = '' }, left_padding = 2 } },
            },
        })
    end
}
