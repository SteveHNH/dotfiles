-- Get out of insert mode quickly
vim.keymap.set('i', 'jk', '<Esc>', { silent = true })

-- ToggleTerm
vim.keymap.set('n', '<leader>tt', ':ToggleTerm<CR>', { silent = true })

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- NVIM Tree Toggle
vim.keymap.set('n', '<leader>nn', ':NvimTreeToggle<CR>', { silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Buffer Navigation
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { silent = true})
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { silent = true})
vim.keymap.set("n", "<leader>bc", ":bd<CR>", { silent = true})


