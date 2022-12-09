-- Colorscheme
-- local colorscheme = "dracula"
local colorscheme = "catppuccin"
local status, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status then
	return
end
