return {
  "Shatur/neovim-session-manager",
  config = function()
    local Path = require('plenary.path')
    local config = require('session_manager.config')
    local session_manager = require('session_manager')
    session_manager.setup({
      sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'),  -- The directory where the session files will be saved.
      autoload_mode = config.AutoloadMode.GitSession,               -- Define what to do when Neovim is started without arguments. See "Autoload mode" section below.
    })

    vim.keymap.set('n', '<leader>sl', session_manager.load_session)
    vim.keymap.set('n', '<leader>sd', session_manager.delete_session)
  end
}
