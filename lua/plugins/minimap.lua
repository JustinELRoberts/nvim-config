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
    local is_float_window = function(winid)
      return vim.api.nvim_win_get_config(winid).relative ~= ""
    end

    vim.g.neominimap = {
      layout = "split",
      notification_level = vim.log.levels.OFF,
      close_if_last_window = true,
      -- Used to prevent opening on the start screen
      tab_filter = function(tab_id)
        local win_list = vim.api.nvim_tabpage_list_wins(tab_id)
        local exclude_ft = { "alpha", "neominimap", "snacks_dashboard" }
        for _, win_id in ipairs(win_list) do
          if not is_float_window(win_id) then
            local bufnr = vim.api.nvim_win_get_buf(win_id)
            if not vim.tbl_contains(exclude_ft, vim.bo[bufnr].filetype) then
              return true
            end
          end
        end
        return false
      end,
    }
  end,
}
