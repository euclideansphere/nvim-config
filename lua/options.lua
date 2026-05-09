-- Hint: use `:h <option>` to figure out the meaning if needed

local opt = vim.opt

opt.clipboard = 'unnamedplus'   -- use system clipboard 
opt.completeopt = {'menu', 'menuone', 'noselect', 'popup'}
opt.autocomplete = true
opt.pumborder = 'single'
opt.pummaxwidth = 40
opt.mouse = 'a'                 -- allow the mouse to be used in Nvim

-- tabs vs spaces
opt.tabstop = 2                 -- number of visual spaces per TAB
opt.softtabstop = 2             -- number of spacesin tab when editing
opt.shiftwidth = 2              -- insert 4 spaces on a tab
opt.expandtab = false           -- tabs are spaces

-- editor shit
opt.number = true               -- show absolute number
opt.relativenumber = false      -- add numbers to each line on the left side
opt.cursorline = true           -- highlight cursor line underneath the cursor horizontally
opt.splitbelow = true           -- open new vertical split bottom
opt.splitright = true           -- open new horizontal splits right
opt.termguicolors = true        -- enable 24-bit RGB color in the TUI
opt.showmode = false            -- we are experienced, wo don't need the "-- INSERT --" mode hint

-- searching
opt.incsearch = true            -- search as characters are entered
opt.hlsearch = false            -- do not highlight matches
opt.ignorecase = true           -- ignore case in searches by default
opt.smartcase = true            -- but make it case sensitive if an uppercase is entered

-- listchars
opt.list = true
opt.listchars:append({
	tab = "→ ",
	eol = "↲",
	space = "\\u2027",
	nbsp = "␣",
	trail = "•",
	extends = "⟩",
	precedes = "⟨"
})

-- folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 2

-- leader
vim.g.mapleader = ","

-- netrw configuration (modernized)
vim.g.netrw_banner = 0          -- hide banner
vim.g.netrw_liststyle = 3       -- tree view
vim.g.netrw_browse_split = 0    -- open in same window
vim.g.netrw_winsize = 25        -- window size
vim.g.netrw_hide = 1            -- hide dotfiles by default

