return {
  "Isrothy/neominimap.nvim",
  version = "v3.*.*",
  lazy = false,
  keys = {
    -- Global Minimap Controls
    { "<leader>mt",  "<cmd>Neominimap toggle<cr>",      desc = "Toggle global minimap" },
    { "<leader>mr",  "<cmd>Neominimap refresh<cr>",     desc = "Refresh global minimap" },

    -- Buffer-Specific Minimap Controls
    { "<leader>mbt", "<cmd>Neominimap bufToggle<cr>",   desc = "Toggle minimap for current buffer" },
    { "<leader>mbr", "<cmd>Neominimap bufRefresh<cr>",  desc = "Refresh minimap for current buffer" },

    ---Focus Controls
    { "<leader>mf",  "<cmd>Neominimap toggleFocus<cr>", desc = "Switch focus on minimap" },
  },
  init = function()
    vim.g.neominimap = {
      auto_enable = false,
      layout = "float",
      notification_level = vim.log.levels.OFF,
      close_if_last_window = true,
    }
  end,
}
