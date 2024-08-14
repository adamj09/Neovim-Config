-- Remap indent and outdent for normal mode
vim.keymap.set("n", "<TAB>", ">>", {}) -- Indent
vim.keymap.set("n", "<S-TAB>", "<<", {}) -- Outdent

-- Remap indent and outdent for visual mode
vim.keymap.set("v", "<TAB>", "<S->>gv", {}) -- Indent
vim.keymap.set("v", "<S-TAB>", "<S-<>gv", {}) -- Outdent

-- Remap file jumping
vim.keymap.set({ "n", "v" }, "<C-J>", "<C-D>", {}) -- Jump down
vim.keymap.set({ "n", "v" }, "<C-K>", "<C-U>", {}) -- Jump up

-- Make CTRL-a the binding to select an entire file
vim.keymap.set("n", "<C-a>", "ggVG", {})

vim.keymap.set("n", "<leader>t", ":Neotree filesystem toggle left <CR>", {})

-- Make ng open Neogit
vim.keymap.set("n", "ng", ":Neogit<CR>", {})

-- Lsp mappings
vim.keymap.set("n", "Z", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

-- Format File
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

-- Telescope
vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR><Esc>", {})
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", {})
vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<CR><Esc>", {})

-- Switch o an a for insert mode
vim.keymap.set("n", "o", "a", {})
vim.keymap.set("n", "a", "o", {})

-- Reveal current file in explorer
vim.keymap.set("n", "<leader>q", ":Neotree reveal<CR>.", {})
