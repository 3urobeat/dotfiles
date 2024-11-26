-- Run over Ada's idiotic INSERT binds causing lag on every space hit with a monster truck
local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.del("i", "<leader>aj", { buffer = bufnr })
vim.keymap.del("i", "<leader>al", { buffer = bufnr })
