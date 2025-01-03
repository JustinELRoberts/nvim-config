return {
  -- This plugin is used to find files
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      local builtin = require('telescope.builtin')

      -- Search working directory
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Search file names' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Search active buffer contents' })
      vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = 'Find references to item under cursor' })
      -- Below is a custom finder found in ../telescope/multigrep.lua
      require("telescope.multigrep").setup()

      -- Search nvim config, packages, etc
      vim.keymap.set('n', '<leader>fv', function()
        builtin.find_files({
          cwd = vim.fn.stdpath("config")
        })
      end, { desc = 'Search neovim config file names' })

      vim.keymap.set('n', '<leader>fp', function()
        builtin.find_files({
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
        })
      end, { desc = 'Search every file that is installed in a plugin' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Search help tags' })
    end
  },

  -- This plugin gives our code actions (from lsp-config.lua) a nice modal popup
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      local telescope = require('telescope')

      telescope.setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          },
          fzf = {},
        },
        defaults = {
          layout_strategy = "vertical",
          layout_config = {
            vertical = { width = 0.8 }
          }
        },
      }

      telescope.load_extension("ui-select")
      telescope.load_extension("fzf")
    end
  }
}
