return{
	'lmantw/themify.nvim',
	priority = 1000,
	config = function()
		require('themify').setup({
			-- Aquí es donde listas los temas que quieres probar
			'folke/tokyonight.nvim',
			'sho-87/kanagawa-paper.nvim',
			'rebelot/kanagawa.nvim',
			'everviolet/nvim',
			-- Opciones adicionales
			async = false,
			activity = true, -- Para que guarde cuál fue el último que usaste
		})
	end,
}
