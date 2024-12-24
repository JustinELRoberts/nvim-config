return {
  "rebelot/kanagawa.nvim",
  config = function()
    -- Default options:
    require("kanagawa").setup({
      compile = false, -- enable compiling the colorscheme
      undercurl = false, -- enable undercurls
      commentStyle = { italic = true },
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      transparent = false, -- do not set background color
      dimInactive = false, -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      theme = "wave",
      background = {      -- map the value of 'background' option to a theme
        dark = "dragon",    -- try "dragon" !
      },
    })

    -- setup must be called before loading
    vim.cmd("colorscheme kanagawa")
  end,
}
