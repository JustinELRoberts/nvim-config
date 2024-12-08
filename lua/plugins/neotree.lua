-- This plugin is for the file navigation side nav
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set('n', '<leader>fe', ':Neotree focus filesystem left<CR>')
    vim.keymap.set('n', '<leader>fb', ':Neotree focus buffers left<CR>')
    vim.keymap.set('n', '<leader>fg', ':Neotree focus git_status left<CR>')
    vim.keymap.set('n', '<leader>ce', ':Neotree close<CR>')

    require("neo-tree").setup({
      event_handlers = {
        {
          event = "file_open_requested",
          handler = function()
            require("neo-tree.command").execute({ action = "close" })
          end
        },
      }
    })
  end
}
