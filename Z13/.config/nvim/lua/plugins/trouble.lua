-- Provides a nice UI for inspecting problems
return {
    "folke/trouble.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim"
    },
    keys = {
        { "<leader>pp", "<cmd>TroubleToggle<CR>", desc = "Open [p]roblems list" },
        { "<leader>pw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Open [w]orkspace problems" },
        { "<leader>pd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Open [d]ocument problems" },
        { "<leader>pq", "<cmd>TroubleToggle quickfix<CR>", desc = "Open problem [q]uickfix list" },
        { "<leader>pl", "<cmd>TroubleToggle loclist<CR>", desc = "Open problem [l]ocation list" },
        { "<leader>pt", "<cmd>TodoTrouble<CR>", desc = "Open [t]odos list" },
    }
}
