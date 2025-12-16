return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = false,  -- load at startup
        config = function()
            local ok, ts_configs = pcall(require, "nvim-treesitter.configs")
            if not ok then
                vim.notify("Treesitter not found!", vim.log.levels.WARN)
                return
            end

            ts_configs.setup({
                ensure_installed = { "bash", "c", "cpp", "html",  "python", "java", "lua" },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = true,
                },
            })
        end,
    },
}

