vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local map = function(mode, l, r, desc)
      vim.keymap.set(mode, l, r, { buffer = args.buf, desc = "LSP: " .. desc })
    end

    map("n", "gd", vim.lsp.buf.definition, "Ir a Definición")
    map("n", "gr", vim.lsp.buf.references, "Ver Referencias")
    map("n", "K", vim.lsp.buf.hover, "Documentación flotante")
    map("n", "<leader>cr", vim.lsp.buf.rename, "Renombrar Símbolo")
    map("n", "<leader>ca", vim.lsp.buf.code_action, "Acciones de Código")
  end,
})
-- lua snipet
local ls = require("luasnip")

-- Saltar hacia adelante en el snippet (Ctrl + j)
vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

-- Saltar hacia atrás en el snippet (Ctrl + k)
vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })
