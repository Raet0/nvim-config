return{
	'lmantw/themify.nvim',
	priority = 10000,
	config = function()
		require('themify').setup({
			-- Themes 
            'folke/tokyonight.nvim',
			-- Opciones adicionales
			async = false,
			activity = true, -- Para que guarde cuál fue el último que usaste
		})
	end,
}
