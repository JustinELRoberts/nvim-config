return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "echasnovski/mini.nvim" },
	config = function()
		local renderMarkdown = require("render-markdown")
    renderMarkdown.setup({
			file_types = { "markdown" },
		})
	end,
}
