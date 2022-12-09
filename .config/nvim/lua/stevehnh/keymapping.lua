-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leaer>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- fugitive
vim.keymap.set('n', '<leader>gs', vim.cmd.Git, {})

-- undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, {})
