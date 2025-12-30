return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            -- El atajo de teclado para abrir/cerrar la terminal (Ctrl + t en este caso)
            open_mapping = [[<c-t>]], 
            direction = "horizontal", -- Puedes usar 'float', 'vertical' o 'tab'
            size = 10,
            shade_terminals = true,
            start_in_insert = true,
            insert_mappings = true,
            persist_size = true,
            close_on_exit = true,
            shell = vim.o.shell,
        })

        -- Función para facilitar la navegación dentro de la terminal
        function _G.set_terminal_keymaps()
            local opts = {buffer = 0}
            vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts) -- Salir de modo insertar en terminal
            vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
            vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts) -- Moverse entre ventanas
            vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
            vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
            vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
        end

        -- Aplicar los atajos solo cuando se abre una terminal
        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    end,
}
