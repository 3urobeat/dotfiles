-- Git blame plugin (like vscode gitlens)
return {
    'APZelos/blamer.nvim',
    config = function()
        vim.g.blamer_enabled = true
    end,
}
