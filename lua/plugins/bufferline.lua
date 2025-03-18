return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local bufferline = require('bufferline')

    -- Go to a specific buffer
    vim.keymap.set("", "<leader>bb", ":BufferLinePick<CR>")
    vim.keymap.set("", "<leader>b1", ":BufferLineGoToBuffer 1<CR>")
    vim.keymap.set("", "<leader>b2", ":BufferLineGoToBuffer 2<CR>")
    vim.keymap.set("", "<leader>b3", ":BufferLineGoToBuffer 3<CR>")
    vim.keymap.set("", "<leader>b4", ":BufferLineGoToBuffer 4<CR>")
    vim.keymap.set("", "<leader>b5", ":BufferLineGoToBuffer 5<CR>")
    vim.keymap.set("", "<leader>b6", ":BufferLineGoToBuffer 6<CR>")
    vim.keymap.set("", "<leader>b7", ":BufferLineGoToBuffer 7<CR>")
    vim.keymap.set("", "<leader>b8", ":BufferLineGoToBuffer 8<CR>")
    vim.keymap.set("", "<leader>b9", ":BufferLineGoToBuffer 9<CR>")

    -- Delete the current buffer
    vim.keymap.set('n', '<leader>bd', ':bd<CR>')
    -- Delete all buffers
    vim.keymap.set('n', '<leader>ba', ':%bd<CR>')
    -- Delete all buffers except the currenly open one
    vim.keymap.set('n', '<leader>bo', ':BufferLineCloseOthers<CR>')
    -- Delete all buffers to the right
    vim.keymap.set('n', '<leader>br', ':BufferLineCloseRight<CR>')
    -- Delete all buffers to the left
    vim.keymap.set('n', '<leader>bl', ':BufferLineCloseLeft<CR>')

    -- Go N buffers to the left/right (not a bufferline thing per-se)
    vim.keymap.set('n', ']b', function()
      local count = vim.v.count
      if count == 0 then
        count = 1
      end
      for _ = 1, count
      do
        vim.cmd('bnext')
      end
    end)
    vim.keymap.set('n', '[b', function()
      local count = vim.v.count
      if count == 0 then
        count = 1
      end
      for _ = 1, count
      do
        vim.cmd('bprev')
      end
    end)

    bufferline.setup({
      options = {
        separator_style = 'slant',
        buffer_close_icon = '',
        numbers = function(opts)
          return string.format('%s', opts.raise(opts.ordinal))
        end,
      }
    })
  end
}
