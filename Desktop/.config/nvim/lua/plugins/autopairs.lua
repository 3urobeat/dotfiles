return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/nvim-cmp",
    },
    config = function()
        local autopairs = require "nvim-autopairs"

        autopairs.setup {
            check_ts = true, -- Enable treesitter
            ts_config = {
                -- Settings I frankly don't fully understand
                lua = { "string" },
                javascript = { "template_string" },
                java = false,
            },
        }

        -- Import nvim-autopairs completion functionality
        local cmp_autopairs = require "nvim-autopairs.completion.cmp"

        -- Import nvim-cmp
        local cmp = require "cmp"

        -- Make autopairs and completion work together
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
}
