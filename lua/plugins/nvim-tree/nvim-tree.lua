return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { "<C-e>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle Explorador de archivos" },
    },
    config = function()
        require("nvim-tree").setup ({
            view = {
                side = "right",
                width = 30,
            },
        })

    end,
}
