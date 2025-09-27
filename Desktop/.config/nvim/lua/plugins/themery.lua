-- Theme picker
return {
    'zaldih/themery.nvim',
    priority = 1000, -- Load before anything else
    opts = {
        themes = { 'bluloco-dark', 'catppuccin', 'bluloco-light', 'solarized' },
        livePreview = true,
    },
}
