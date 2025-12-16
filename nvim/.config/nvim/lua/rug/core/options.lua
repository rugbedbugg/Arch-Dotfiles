-- vim.g.loaded_netrw = 0
-- vim.g.loaded_netrwPlugin = 0
-- vim.cmd("let g:netrw_lifestyle = 3")

-- Disable netrw banner
vim.cmd("let g:netrw_banner = 0")

-- Enable Syntax Highlighting
vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Identation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- Always hard wrap at 80 characters in every file
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    callback = function()
        vim.opt_local.textwidth = 80
        vim.opt_local.formatoptions:append("t") --wrap text
        vim.opt_local.smartindent = false
    end,
})

-- Backup and undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search
vim.opt.incsearch = true
vim.opt.inccommand = "split" 
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- UI
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.backspace = {"start", "eol", "indent"}

-- Folding (for nvim-ufo)
vim.o.foldenable = true
vim.o.foldmethod = "manual"
vim.o.foldlevel = 99
vim.o.foldcolumn = "0"

-- Window Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Misc
vim.opt.guicursor = ""
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.colorcolumn = "80"
vim.opt.clipboard:append("unnamedplus")
vim.opt.hlsearch = true
vim.opt.mouse = "a"
vim.g.editorconfig = true
