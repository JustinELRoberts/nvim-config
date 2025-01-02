return {
  "famiu/bufdelete.nvim",
  config = function()
    local bufdelete = require('bufdelete')
    vim.keymap.set('n', '<leader>bw', bufdelete.bufdelete)
    vim.keymap.set('n', '<leader>bd', bufdelete.bufwipeout)

    -- These aren't specific to bufdelete but I will keep them here nevertheless
    vim.keymap.set('n', '[b', function()
      return vim.v.count .. ":bprev<CR>"
    end, { expr = true })
    vim.keymap.set('n', ']b', function()
      return vim.v.count .. ":bnext<CR>"
    end, { expr = true })
  end
}
