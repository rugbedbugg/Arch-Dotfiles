return {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = "cd app && npm install",
    config = function()
        vim.g.mkdp_filetypes = { "markdown" }
    end,
}

