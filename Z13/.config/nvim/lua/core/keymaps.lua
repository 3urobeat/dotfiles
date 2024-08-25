-- 3urobeat's neovim config, built upon https://github.com/nvim-lua/kickstart.nvim

local k = vim.keymap

-- List submenu
k.set('n', '<leader>lt', '<cmd>Themery<CR>', { desc = 'Choose theme' })
k.set('n', '<leader>ls', require('auto-session.session-lens').search_session, { noremap = true, desc = 'Choose stored session' })

-- Easily show/hide fs explorer
k.set('n', '<leader>E', '<cmd>Neotree toggle<CR>')

-- Clear highlights on search when pressing <Esc> in normal mode
k.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
k.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Keybinds to move between split windows
k.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
k.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
k.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
k.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
