-- Remap indent and outdent for normal mode
vim.keymap.set("n", "<TAB>", ">>", opts) -- Indent
vim.keymap.set("n", "<S-TAB>", "<<", opts) -- Outdent

-- Remap indent and outdent for visual mode
vim.keymap.set('v', '<TAB>', '<S->>gv', opts) -- Indent
vim.keymap.set('v', '<S-TAB>', '<S-<>gv', opts) -- Outdent

-- Remap file jumping
vim.keymap.set("n", "<C-J>", "<C-D>", opts) -- Jump down
vim.keymap.set("n", "<C-K>", "<C-U>", opts) -- Jump up

-- Make CTRL-a the binding to select an entire file
vim.keymap.set("n", "<C-a>", "ggVG", opts)

-- Make tt toggle NvimTree
vim.keymap.set("n", "tt", ":NvimTreeToggle<CR>", opts)

-- Telescope commands
vim.keymap.set("n", "TT", ":Telescope<CR>", opts) -- Open Telescope
vim.keymap.set("n", "FF", ":Telescope find_files<CR>", opts) -- Find files in current dir
vim.keymap.set("n", "FK", ":Telescope keymaps<CR>", opts) -- Look at keymaps
vim.keymap.set("n", "FR", ":Telescope oldfiles<CR>", opts) -- Find previously viewed files
