-- Set tab to 2 spaces
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.scrolloff = 10

-- Show line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Keybind to save/quit
vim.keymap.set('n', '<leader>qq', ':wqa<CR>')

-- Keybinds to execute some lua
vim.keymap.set('n', '<leader><leader>x', '<cmd>source %<CR>')
vim.keymap.set('n', '<leader>x', ':.lua<CR>')
vim.keymap.set('v', '<leader>x', ':lua<CR>')

-- Keybinds for buffer management
vim.keymap.set('n', '[b', ':bprev<CR>')
vim.keymap.set('n', ']b', ':bnext<CR>')
-- Delete the current buffer
vim.keymap.set('n', '<leader>bd', ':bd<CR>')
-- Delete all buffers
vim.keymap.set('n', '<leader>ba', ':%bd<CR>')
-- Delete all buffers except the currenly open one
vim.keymap.set('n', '<leader>bo', ':%bd|edit#|bd#<CR>')

-- Allow yank to clipboard on WSL
if vim.fn.has("wsl") then
  vim.g.clipboard = {
    name = "clip.exe (Copy Only)",
    copy = {
      ["+"] = "/mnt/c/Windows/System32/clip.exe",
      ["*"] = "/mnt/c/Windows/System32/clip.exe"
    },
    paste = {
      ["+"] = "/mnt/c/Windows/System32/clip.exe",
      ["*"] = "/mnt/c/Windows/System32/clip.exe"
    },
    cache_enabled = true
  }
end
