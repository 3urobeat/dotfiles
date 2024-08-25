-- 3urobeat's neovim config, built upon https://github.com/nvim-lua/kickstart.nvim

-- Load config
require 'core.config'

-- Set <space> as the leader key
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Load lazy package manager
require 'core.lazy'

-- Load keybinds after plugins
require 'core.keymaps'

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
