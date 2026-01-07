local signs = { Error = "", Warn = "", Hint = "󰌵", Info = "" }

vim.diagnostic.config({
    virtual_text = {
        current_line = true,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = signs.Error,
            [vim.diagnostic.severity.WARN] = signs.Warn,
            [vim.diagnostic.severity.HINT] = signs.Hint,
            [vim.diagnostic.severity.INFO] = signs.Info,
        },
    },
})

vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename variable" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

vim.lsp.enable({ "pyright", "angularls", "bashls", "cssls", "html", "lua_ls", "ts_ls",})
vim.lsp.config("pyright", require("lsp.pyright"))
vim.lsp.config("angularls", require("lsp.angularls"))
vim.lsp.config("bashls", require("lsp.bashls"))
vim.lsp.config("cssls", require("lsp.cssls"))
vim.lsp.config("html", require("lsp.html"))
vim.lsp.config("lua_ls", require("lsp.lua_ls"))
vim.lsp.config("ts_ls", require("lsp.ts_ls"))
