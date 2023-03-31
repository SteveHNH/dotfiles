require("bufferline").setup({
  options = {
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        hightlight = "Directory",
        separator = true,
      }
    },
  },
})

