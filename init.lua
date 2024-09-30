require('options')
require('keymaps')
require('plugins')
require('colorscheme')
require('lsp')

vim.keymap.set("n", "<c-P>", require('fzf-lua').files, { desc = "Fzf Files" })

