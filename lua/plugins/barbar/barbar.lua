return {
  "romgrk/barbar.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {
    animation = true,
    insert_at_start = true,
    -- Esto crea el límite visual para que las pestañas no toquen el explorador
    sidebar_filetypes = {
      ["nvim-tree"] = { 
        event = "BufWipeout",
        text = "Explorador", -- Opcional: añade un texto sobre el nvim-tree
        align = "center" 
      },
    },
  },
}
