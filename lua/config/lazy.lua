local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        -- file explorer
        { import = "plugins.file_explorer" },

        -- theme selector
        { import = "plugins.themes" },

        -- linea inferior (barra de estado)
        { import = "plugins.statusbar" },

        -- buscandor 
        { import = "plugins.telescope" },

        -- terminal 
        { import = "plugins.terminal" },

        -- sintaxis lenguage
        { import = "plugins.treesitter" },

        -- git(signs)
        { import = "plugins.gitsigns" },

        -- autoComplete
        { import = "plugins.autocomplete" },

        -- mason(plugins)
        { import = "plugins.mason" },

        -- lsp
        { import = "plugins.lsp" },

        -- autopais
        { import = "plugins.autopairs" },

        -- icons
        { import = "plugins.icons" },

        --snacks 
        { import = "plugins.snacks" },

        --tab-bar
        { import = "plugins.tabs" },

        -- new notifications
        { import = "plugins.notifications" },
        
        -- luasnip
        { import = "plugins.luasnip" },
    },
})
