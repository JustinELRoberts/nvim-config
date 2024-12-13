return {
  "lewis6991/gitsigns.nvim",
  config = function()
    local gitsigns = require('gitsigns')

    gitsigns.setup({
      current_line_blame = true,
    })

    -- If we are in visual mode, we will be staging only the hunk in our selection
    vim.keymap.set("v", "<leader>gs", gitsigns.stage_hunk, {})

    -- If we are in normal mode, we will be staging/unstaging the entire buffer
    vim.keymap.set("n", "<leader>gs", gitsigns.stage_buffer, {})
    vim.keymap.set("n", "<leader>gr", gitsigns.reset_buffer_index, {})

    -- Undo the last staged hunk
    vim.keymap.set("n", "<leader>gu", gitsigns.undo_stage_hunk, {})

    -- Select the hunk we are inside of 
    vim.keymap.set("n", "<leader>gh", gitsigns.select_hunk, {})

    -- Open a git blame buffer
    vim.keymap.set("n", "<leader>gb", gitsigns.blame, {})

    -- Open a buffer to view the git diff
    vim.keymap.set("n", "<leader>gd", gitsigns.diffthis, {})

    -- Next and previous git hunk
    vim.keymap.set("n", "[g", gitsigns.next_hunk, {})
    vim.keymap.set("n", "]g", gitsigns.prev_hunk, {})
  end
}
