-- disable netrw at the very start of your init.lua (strongly advised)
-- for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- basics
vim.opt.number = true -- add line numbers
vim.opt.relativenumber = true -- add relative line numbers
vim.opt.backup = false -- create a backup file
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.swapfile = false -- create a swap file
vim.opt.updatetime = 300 -- faster completion. Default is 4000ms
vim.opt.wrap = false -- don't wrap lines
vim.opt.termguicolors = true

-- keymapping
vim.g.mapleader = " " -- set leader key to space
