-- Hint: use `:h <option>` to figure out the meaning if needed
--
vim.opt.clipboard = 'unnamedplus'   -- use system clipboard 
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.mouse = 'a'                 -- allow the mouse to be used in Nvim

-- tabs vs spaces
vim.opt.tabstop =24                 -- number of visual spaces per TAB
vim.opt.softtabstop = 2             -- number of spacesin tab when editing
vim.opt.shiftwidth = 2              -- insert 4 spaces on a tab
vim.opt.expandtab = false           -- tabs are spaces

-- editor shit
vim.opt.number = true               -- show absolute number
vim.opt.relativenumber = true       -- add numbers to each line on the left side
vim.opt.cursorline = true           -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true           -- open new vertical split bottom
vim.opt.splitright = true           -- open new horizontal splits right
vim.opt.termguicolors = true        -- enable 24-bit RGB color in the TUI
vim.opt.showmode = false            -- we are experienced, wo don't need the "-- INSERT --" mode hint

-- searching
vim.opt.incsearch = true            -- search as characters are entered
vim.opt.hlsearch = false            -- do not highlight matches
vim.opt.ignorecase = true           -- ignore case in searches by default
vim.opt.smartcase = true            -- but make it case sensitive if an uppercase is entered

-- listchars
vim.opt.list = true
vim.opt.listchars:append({
    tab = "→ ",
    eol = "↲",
    space = "\\u2027",
    nbsp = "␣",
    trail = "•",
    extends = "⟩",
    precedes = "⟨"
})

-- folding
vim.opt.foldmethod = 'syntax'
vim.opt.foldlevel = 1

-- tree file explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

