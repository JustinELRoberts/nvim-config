return {
  'echasnovski/mini.map',
  version = '*',
  config = function()
    local minimap = require('mini.map')
    minimap.setup()
    minimap.toggle()
    vim.keymap.set('n', '<Leader>mt', minimap.toggle)
    vim.keymap.set('n', '<Leader>mf', minimap.toggle_focus)
    vim.keymap.set('n', '<Leader>mr', minimap.refresh)
  end
}
