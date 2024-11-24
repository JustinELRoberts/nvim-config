-- This plugin is used to provide syntax highlighting
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = { "lua", "javascript", "c", "rust", "python" },
			-- Automatically install parsers for file types we have not yet encountered
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
