-- Discord Rich Presence Integration
return {
    'vyfor/cord.nvim',
    run = ':Cord update',
    event = 'VeryLazy',
    opts = {
        buttons = {
            {
            label = 'View Repository',
            url = function(opts) return opts.repo_url end,
            },
        },
    }, -- Calls .setup()
}
