-- Indentation Guides
return {
    "lukas-reineke/indent-blankline.nvim",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    main = "ibl",
    opts = {},
}
