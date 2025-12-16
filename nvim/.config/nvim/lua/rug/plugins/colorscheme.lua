return {
    {
    -- NOTE: Autogen Theme
        "dylanaraps/wal.vim",
        lazy = false,                   -- must load at startup
        priority = 1000,
        config = function()
            vim.cmd("colorscheme wal")
        end,
    },
}
