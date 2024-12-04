-- This plugin is for the file navigation side nav
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "BurntSushi/ripgrep",
  },
  config = function()
    vim.keymap.set('n', '<leader>fe', ':Neotree focus filesystem left<CR>')
    vim.keymap.set('n', '<leader>be', ':Neotree focus buffers left<CR>')
    vim.keymap.set('n', '<leader>ge', ':Neotree focus git_status left<CR>')
    vim.keymap.set('n', '<leader>ce', ':Neotree close<CR>')

    require("neo-tree").setup({
      event_handlers = {
        {
          event = "file_open_requested",
          handler = function()
            require("neo-tree.command").execute({ action = "close" })
          end
        },
      },
      filesystem = {
        filtered_items = {
          visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
          hide_dotfiles = false,
          hide_gitignored = true,
        },
      },
    })
  end
}
