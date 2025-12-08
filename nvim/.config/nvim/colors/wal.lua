-- Load pywal colors
local wal = io.open(os.getenv 'HOME' .. '/.cache/wal/colors.lua', 'r')
if not wal then
  return
end

local colorscheme = {}
load(wal:read '*a', 'wal_colors', 't', colorscheme)()
wal:close()

local colors = colorscheme.colors or {}

-- UI-only highlight groups (syntax stays default)
vim.api.nvim_set_hl(0, 'Normal', { bg = colors.background })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = colors.background })
vim.api.nvim_set_hl(0, 'LineNr', { fg = colors.color8 })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = colors.color1 })
vim.api.nvim_set_hl(0, 'StatusLine', { bg = colors.color2, fg = colors.color15 })
vim.api.nvim_set_hl(0, 'VertSplit', { fg = colors.color0 })
vim.api.nvim_set_hl(0, 'SignColumn', { bg = colors.background })
