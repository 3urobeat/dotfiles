-- Add git icons
return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        -- Yoinked from https://github.com/josean-dev/dev-environment-files/blob/main/.config/nvim/lua/josean/plugins/gitsigns.lua
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, desc)
                vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
            end

            -- Navigation
            map("n", "]h", gs.next_hunk, "Next Hunk")
            map("n", "[h", gs.prev_hunk, "Prev Hunk")

            -- Actions
            map("n", "<leader>gs", gs.stage_hunk, "[s]tage hunk")
            map("n", "<leader>gr", gs.reset_hunk, "[r]eset hunk")
            map("v", "<leader>gs", function()
                gs.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
            end, "[s]tage hunk")
            map("v", "<leader>gr", function()
                gs.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
            end, "[r]eset hunk")

            map("n", "<leader>gS", gs.stage_buffer, "[S]tage buffer")
            map("n", "<leader>gR", gs.reset_buffer, "[R]eset buffer")

            map("n", "<leader>gu", gs.undo_stage_hunk, "[u]ndo stage hunk")

            map("n", "<leader>gp", gs.preview_hunk, "[p]review hunk")

            map("n", "<leader>gb", function()
                gs.blame_line { full = true }
            end, "[b]lame line")
            map("n", "<leader>gB", gs.toggle_current_line_blame, "Toggle line [B]lame")

            map("n", "<leader>gd", gs.diffthis, "[d]iff this")
            map("n", "<leader>gD", function()
                gs.diffthis "~"
            end, "[D]iff this ~")

            -- Text object
            map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
        end,
        signs = {
            add = { text = "+" },
            change = { text = "~" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "~" },
        },
    },
}
