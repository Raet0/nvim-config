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
