-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- For conciseness
-- noremap means mapping should not be redefined
-- silent = true means that commands should not be shown on the command line
local opts = { noremap = true }
-- local opts = {noremap = true, silent = true}

-- save file
-- first arg is the mode in which the keymap will be applied
-- second arg is the keymap itself <C-s> is the same as Ctrl+s
-- third arg is the command to be executed
--  - <cmd> means we'll be in command mode
--  - space w <CR> means w and Enter
--  the last arg is the options (local opts variable that we declared above)
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- save file without auto-formatting
-- "leader sn"
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)

-- quit file
-- "CTRL+q"
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)

-- delete single character without copying into register
-- this changes the default behavior of the x key
vim.keymap.set('n', 'x', '"_x', opts)

-- stolen from theprimeagen's config (START)
--   These settings keep the cursor in the center of the screen which makes things easier to follow
-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)
-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)
-- stolen from theprimeagen's (END)

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Buffers
-- tab and shift tab to navigate forwards and backwards between files
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
-- close a buffer with leader+x
vim.keymap.set('n', '<leader>x', ':bdelete!<CR>', opts)   -- close buffer
-- new buffer with leader+b
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts) -- new buffer

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', opts)      -- split window vertically
vim.keymap.set('n', '<leader>h', '<C-w>s', opts)      -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', opts)     -- make split windows equal width & height
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- close current split window

-- navigating splits in Vim can be a bit painful here are some extra keymaps
--
-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Managing tabs
-- tabs as in actual Vim tabs not buffers
-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts)   -- open new tab
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts)     --  go to next tab
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts)     --  go to previous tab

-- Toggle line wrapping
--  if we have a very long line, we can hover over and press leader+lw to wrap the line in the current visable window
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode
--  you can visual select the group of lines you want to indent and then indent with the greater than symbol `>`
--    however, the problem with this is that it goes into insert mode after indenting once
--    this prevents the insert mode after indenting
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
--  when we yank something, highlight something else, and press p to paste over it, THEN whatever we pasted over will replace what we last yanked
--   this prevents the replacing behavior and keep what you've last yanked
vim.keymap.set('v', 'p', '"_dP', opts)

-- Diagnostic keymaps
--  these keymaps allow for navigating diagnostic more efficiently
--  what are diagnostics? when there is an issue with the code, the LSP will detect this and show this directly on the line where the issue is
--  these keymaps allow for easy jumping between those diagnostics
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' }) -- see all diagnostics in a list
