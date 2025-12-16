return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- colors provided by wal.vim (fallbacks included)
        local colors = {
            bg       = vim.g.background or "#000000",
            fg       = vim.g.foreground or "#c0c0c0",
            black    = vim.g.color0 or "#000000",
            red      = vim.g.color1 or "#ff5555",
            green    = vim.g.color2 or "#50fa7b",
            yellow   = vim.g.color3 or "#f1fa8c",
            blue     = vim.g.color4 or "#bd93f9",
            magenta  = vim.g.color5 or "#ff79c6",
            cyan     = vim.g.color6 or "#8be9fd",
            white    = vim.g.color7 or "#bbbbbb",
        }
        require("lualine").setup({
            options = {
                theme = wal_theme,
                section_separators = "",
                component_separators = "",
                globalstatus = true,
            },
            sections = {
                lualine_a = { 
                    { 
                        "mode", 
                        color = { fg = "#FFFFFF", bg = "#000000" } 
                    },
                },
                lualine_b = { 
                    { 
                        "branch", 
                        color = { fg = "#FFFFFF", bg = "#000000" } 
                    },
                },
                lualine_c = { 
                    { 
                        "filename", 
                        color = { fg = "#000000", bg = "FFFFFF" } 
                    },     
                },
                lualine_x = { 
                    { 
                        "encoding", 
                        color = { fg = "#000000", bg = colors.yellow } 
                    },
                    { 
                        "filetype", 
                        color = { fg = "#000000", bg = colors.yellow } 
                    },
                },
                lualine_y = { 
                    { 
                        "progress", 
                        color = { fg = "#FFFFFF", bg = "#000000" } 
                    },
                },
                lualine_z = { 
                    { 
                        "location", 
                        color = { fg = "#FFFFFF", bg = "#000000" } 
                    },
                },
            },
        })
    end,
}
