-- Set tab to 2 spaces
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader=" "
vim.g.maplocalleader = "\\"

vim.opt.scrolloff = 10

-- Show line numbers
vim.wo.number = true

-- Keybinds to save/quit
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>wq', ':wq<CR>')
vim.keymap.set('n', '<leader>wqa', ':wqa<CR>')
