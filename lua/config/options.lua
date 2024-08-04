-- Disable netrw for NvimTree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable 24-bit colour
vim.opt.termguicolors = true

-- NvimTree
vim.g.nvim_tree_respect_buf_cwd = 1

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.o.statuscolumn = "%l %=%r " -- Both relative and absolute line numbers enabled

-- Command line height
vim.opt.cmdheight = 1

-- Tab splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Line wrapping
vim.opt.wrap = false

-- Make tabs 4 spaces
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Sync Neovim's clipboard with the system's clipboard
vim.opt.clipboard = "unnamedplus"

-- Keep cursor in center of screen when scrolling
vim.opt.scrolloff = 999

-- Allow virtual edit for block select mode
vim.opt.virtualedit = "block"

-- Not sure what this does but keep it on "split"
vim.opt.inccommand = "split"

vim.opt.ignorecase = true

vim.opt.termguicolors = true

-- Keymap leader
vim.g.mapleader = " "

-- Cursor line number
vim.opt.cursorline = true

-- For better search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Fast update time
vim.opt.updatetime = 50
