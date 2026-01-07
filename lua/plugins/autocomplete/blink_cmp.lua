return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  opts = {
    fuzzy = {
      implementation = "lua",
    },

    keymap = {
      preset = "none",

      -- Abrir menú manualmente (equivale a <C-Space>)
      ["<C-Space>"] = { "show", "fallback" },

      -- Confirmar selección (equivale a <CR> con select = true)
      ["<CR>"] = { "accept", "fallback", auto_select = true, },

      -- Navegación por el menú
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
  },
}

