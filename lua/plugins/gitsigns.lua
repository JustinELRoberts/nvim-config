return {
  "lewis6991/gitsigns.nvim",
  config = function()
    local gitsigns = require('gitsigns')

    gitsigns.setup({
      current_line_blame = true,
    })

    -- Stage the hunk that our cursor is currently in
    vim.keymap.set("n", "<leader>gs", gitsigns.stage_hunk, {})
    -- Stage all the hunks our selection intersects
    vim.keymap.set('v', "<leader>gs", function()
      gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end)
    -- Stage entire buffer
    vim.keymap.set({ "n", "v" }, "<leader>gS", gitsigns.stage_buffer, {})

    -- Revert changes in the hunk our cursor is currently in (only if it is not staged)
    vim.keymap.set("n", "<leader>gr", gitsigns.reset_hunk, {})
    -- Revert changes in all hunks our selection intersects (and are not yet staged)
    vim.keymap.set('v', "<leader>gr", function()
      gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end)
    -- Revert changes in all hunks in the buffer (that are not yet staged)
    vim.keymap.set({ "n", "v" }, "<leader>gR", gitsigns.reset_buffer, {})

    -- Undo the last staged hunk
    vim.keymap.set({ "n", "v" }, "<leader>gu", gitsigns.undo_stage_hunk, {})

    -- Select (highlight) the hunk we are inside of
    vim.keymap.set("n", "<leader>gh", gitsigns.select_hunk, {})

    -- Open a buffer to view the git diff
    vim.keymap.set("n", "<leader>gd", gitsigns.diffthis, {})

    -- Preview the changes made in the hunk under our cursor
    vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk_inline, {})

    -- Next and previous git hunk
    vim.keymap.set("n", "[g", gitsigns.prev_hunk, {})
    vim.keymap.set("n", "]g", gitsigns.next_hunk, {})
  end
}
