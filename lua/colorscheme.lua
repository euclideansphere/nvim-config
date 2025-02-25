local colorscheme = 'gruvbox'

local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_ok then
	vim.notify('colorscheme ' .. colorscheme .. ' not found!')
	return
end

-- enable partial transparency (terminal emulator must also support for it to work)
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
