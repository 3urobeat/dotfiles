-- Trim trailing whitespaces from files
return {
    'cappyzawa/trim.nvim',
    opts = {
        ft_blocklist = { 'markdown' },
    },
}
