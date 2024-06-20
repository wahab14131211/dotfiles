-- Custom neovim config file for common settings

-- Setup the leader key (used to activate custom commands)
vim.g.mapleader = " "

-- Enable relative and absolute line numbers
vim.opt.number = true
vim.opt.relativenumber = true

--enable mouse mode
vim.opt.mouse = "a"

-- setup tab behaviour
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Save undo history and setup backup files
vim.opt.undodir = os.getenv("HOME") .. "/vimtmp/nvim/undodir"
vim.opt.undofile = true
vim.opt.backupdir = os.getenv("HOME") .. "/vimtmp/nvim/backups//" --double slash build build complete path into filename
vim.opt.backup = true

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Better Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Misc
vim.opt.breakindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.colorcolumn = "120"
vim.opt.scrolloff = 10
vim.opt.hlsearch = true
vim.g.have_nerd_font = true

-- Highlight when yanking (copying) text
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
