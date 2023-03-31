-- Copilot Setup
local cmp = require 'cmp'
vim.g.copilot_filetypes = { xml = false, md = false}
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_map = true


-- Fix completion for cmp copilot
local function complete()
  return function()
    if cmp.visible() then
      cmp.mapping.confirm({select = true})()
    else
      vim.api.nvim_feedkeys(vim.fn['copilot#Accept'](), 'i', true)
    end
  end
end

cmp.setup({
  mapping = {
    ['<Tab>'] = cmp.mapping(complete(), {'i', 'c'}),
  }
})


