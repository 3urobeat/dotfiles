-- 3urobeat's neovim config, built upon https://github.com/nvim-lua/kickstart.nvim

local o = vim.opt

-- Indentation
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true -- Expand tabs to spaces

-- Enable mouse mode, can be useful for resizing splits for example
o.mouse = 'a'

-- Disable line wrapping
o.wrap = false

-- Don't show the mode, since it's already in the status line
o.showmode = false

-- Enable more colors
o.termguicolors = true

-- Show which line your cursor is on
o.cursorline = true

-- Use block cursor in all modes
o.guicursor = 'n-v-i-c:block-Cursor'

-- Sync clipboard between OS and Neovim.
vim.schedule(function() -- Schedule the setting after `UiEnter` because it can increase startup-time.
    o.clipboard = 'unnamedplus'
end)

-- Enable break indent
o.breakindent = true

-- Save undo history
o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
o.ignorecase = true
o.smartcase = true

-- Keep signcolumn on by default
o.signcolumn = 'yes'

-- Decrease update time
o.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
o.timeoutlen = 300

-- Configure how new splits should be opened
o.splitright = true
o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
o.list = true
o.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
o.inccommand = 'split'

-- Minimal number of screen lines to keep above and below the cursor.
o.scrolloff = 10

-- Create an autocommand group for toggling between relative and absolute line numbers
o.number = true -- Show line numbers
vim.api.nvim_create_augroup('NumberToggle', { clear = true })

vim.api.nvim_create_autocmd({ 'BufEnter', 'FocusGained', 'InsertLeave', 'WinEnter' }, {
    group = 'NumberToggle',
    callback = function()
        if vim.wo.number and vim.fn.mode() ~= 'i' then
            vim.wo.relativenumber = true
        end
    end,
})

vim.api.nvim_create_autocmd({ 'BufLeave', 'FocusLost', 'InsertEnter', 'WinLeave' }, {
    group = 'NumberToggle',
    callback = function()
        if vim.wo.number then
            vim.wo.relativenumber = false
        end
    end,
})

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
