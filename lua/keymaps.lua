local function merge(t1, t2)
	local result = {}
	for key, value in pairs(t1) do
		result[key] = value
	end
	for key, value in pairs(t2) do
		result[key] = value
	end
	return result
end

local function with_defaults(mode, opts_1)
	return function(trig, result, opts_2)
		-- hint: see `:h vim.keymap.set()`
		vim.keymap.set(mode, trig, result,
			merge(
				opts_1 or {
					noremap = true,      -- non-recursive
					silent = true,       -- do not show message
				},
				opts_2 or {}
			)
		)
	end
end

-- normal mode --

local set_n_keymap = with_defaults('n')

-- Better window navigation
set_n_keymap('<C-h>', '<C-w>h')
set_n_keymap('<C-j>', '<C-w>j')
set_n_keymap('<C-k>', '<C-w>k')
set_n_keymap('<C-l>', '<C-w>l')

-- resize with arrows
-- delta: 2 lines
set_n_keymap('<C-Up>', ':resize -2<CR>')
set_n_keymap('<C-Down>', ':resize +2<CR>')
set_n_keymap('<C-Left>', ':vertical resize +2<CR>')
set_n_keymap('<C-Right>', ':vertical resize -2<CR>')

-- ergo save all and exit
set_n_keymap('<Leader>ewq', ':wqa<CR>')

-- diagnostics (lint tags)
set_n_keymap('<space>e', vim.diagnostic.open_float)
set_n_keymap('[d', vim.diagnostic.goto_prev)
set_n_keymap(']d', vim.diagnostic.goto_next)
set_n_keymap('<space>q', vim.diagnostic.setloclist)

-- visual mode --

local set_v_keymap = with_defaults('v')

-- allows repeated block shift left/right
set_v_keymap('<', '<gv')
set_v_keymap('>', '>gv')

local set_t_keymap = with_defaults('t')

set_t_keymap('<ESC>', '<C-\\><C-n>')
