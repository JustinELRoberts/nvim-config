return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local bufferline = require('bufferline')
    bufferline.setup({
      options = {
        separator_style = 'slant',
        buffer_close_icon = '',
      }
    })
    -- This isn't a bufferline specific keybind, but switching buffers is sufficiently related that it feels like a good place
    vim.keymap.set('n', '[b', ':bp<CR>')
    vim.keymap.set('n', ']b', ':bn<CR>')
    vim.keymap.set('n', 'bs', ':w|bd<CR>')
    vim.keymap.set('n', 'bd', ':bd!<CR>')
  end
}
