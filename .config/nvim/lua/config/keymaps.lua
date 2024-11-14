-- space bar leader
vim.g.mapleader = " "
vim.g.maplocalleader = ' '

local keymap = vim.keymap
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
-- keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
-- keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
-- keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

keymap.set('i', 'jk', '<ESC>', { desc = 'Exit insert mode' })

keymap.set('n', '<leader>+', '<C-a>', { desc = 'Increment number' })
keymap.set('n', '<leader>-', '<C-x>', { desc = 'Decrement number' })

keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'Open vertical window' })
keymap.set('n', '<leader>wh', '<C-w>s', { desc = 'Open horizontal window' })
keymap.set('n', '<leader>we', '<C-w>=', { desc = 'Make splits equal size' })
keymap.set('n', '<leader>wx', '<cmd>close<CR>', { desc = 'Close window' })
