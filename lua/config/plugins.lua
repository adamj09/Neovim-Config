-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapLeader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to set up other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
        -- Import plugins here

        { -- Tokoyo Night Colorscheme  
            "folke/tokyonight.nvim",
            config = function()
                vim.cmd.colorscheme("tokyonight-night")                                
		    end,
            lazy = false,
            priority = 1000,
            opts = {}
        },
        { -- Treesitter
            "nvim-treesitter/nvim-treesitter",
            config = function()
                require("nvim-treesitter.configs").setup({
                    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust", }, -- Treesitter parsers installed

                    auto_install = true, -- Auto-installs parser for any file that does not have one yet

                    hightlight = { -- Better syntax highlighting using Treesitter parsers
                        enable = true,
                    },

                    incremental_selection = {
                        enable = true,
                        keymaps = {
                            init_selection = "<Leader>ss",
                            node_incremental = "<Leader>si",
                            scope_incremental = "<Leader>sc",
                            node_decremental = "<Leader>sd",
                        },
                    },
                    textobjects = {
                        select = {
                            enable = true,

                            -- Automatically jump forward to textobj, similar to targets.vim
                            lookahead = true,

                            keymaps = {
                                ["af"] = "@function.outer",
                                ["if"] = "@function.inner",
                                ["ac"] = "@class.outer",
                                ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                                -- You can also use captures from other query groups like `locals.scm`
                                ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                            },
                            selection_modes = {
                                ['@parameter.outer'] = 'v', -- charwise
                                ['@function.outer'] = 'v', -- charwise
                                ['@class.outer'] = '<c-v>', -- blockwise
                            },
                            -- If you set this to `true` (default is `false`) then any textobject is
                            -- extended to include preceding or succeeding whitespace. Succeeding
                            -- whitespace has priority in order to act similarly to eg the built-in
                            -- `ap`.
                            include_surrounding_whitespace = true,
                        },
                    },
                    autopairs = {
                        enable = true,
                    },
                    autotag = {
                        enable = true,
                    },
                })
            end,
        },
        { -- Treesitter Text Objects
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        { -- Auto LSP Configurator
            "neovim/nvim-lspconfig",
        },
        { -- Mason
            "williamboman/mason.nvim",
            config = function()
                require("mason").setup()
            end,
        },
	    { -- Mason's LSP Configurator
            "williamboman/mason-lspconfig.nvim",
            dependencies = { "mason.nvim" },
            config = function()
                require("mason-lspconfig").setup()
                require("mason-lspconfig").setup_handlers({
                    function (server_name)
                        require("lspconfig")[server_name].setup({})
                    end,
                })
            end,
        },
        { -- Autosave
            "pocco81/auto-save.nvim",
            config = function()
                require("auto-save").setup()
            end,
        },
        { -- Indentation Guides
            "lukas-reineke/indent-blankline.nvim",
            main = "ibl",
            opts = {},
            config = function()
                require("ibl").setup({
                    indent = { char = "▏" },
                })
            end,
	    },
        { -- Plenary
            "nvim-lua/plenary.nvim",
        },
        { -- Highlight Todo Comments
            "folke/todo-comments.nvim",
            dependencies = { "nvim-lua/plenary.nvim" },
            opts = {},
        },
        { -- Telescope-fzf (speeds up telescope)
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release"
        },
        { -- Devicons (icons and colours)
            "nvim-tree/nvim-web-devicons",
            config = function()
                require'nvim-web-devicons'.setup({
                    -- your personnal icons can go here (to override)
                    -- you can specify color or cterm_color instead of specifying both of them
                    -- DevIcon will be appended to `name`
                    override = {
                        zsh = {
                            icon = "",
                            color = "#428850",
                            cterm_color = "65",
                            name = "Zsh"
                        }
                    };
                    color_icons = true;
                    default = true;
                    strict = true;
                    -- same as `override` but specifically for overrides by filename
                    -- takes effect when `strict` is true
                    override_by_filename = {
                        [".gitignore"] = {
                            icon = "",
                            color = "#f1502f",
                            name = "Gitignore"
                        }
                    };
                    -- same as `override` but specifically for overrides by extension
                    -- takes effect when `strict` is true
                    override_by_extension = {
                        ["log"] = {
                            icon = "",
                            color = "#81e043",
                            name = "Log"
                        }
                    };
                    -- same as `override` but specifically for operating system
                    -- takes effect when `strict` is true
                    override_by_operating_system = {
                        ["apple"] = {
                            icon = "",
                            color = "#A2AAAD",
                            cterm_color = "248",
                            name = "Apple",
                        },
                    };
                })
            end,
        },
        { -- Telescope
            "nvim-telescope/telescope.nvim",
            tag = "0.1.8",
            dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim", "nvim-tree/nvim-web-devicons" },
        },
        { -- File Tree
            "nvim-tree/nvim-tree.lua",
            version = "*",
            lazy = false,
            dependencies = {
                "nvim-tree/nvim-web-devicons",
            },
            config = function()
                require("nvim-tree").setup ({
                    update_cwd = true,
                    update_focused_file = {
                        enable = true,
                        update_cwd = true,
                    },
                    sort = {
                        sorter = "name",
                    },
                    view = {
                        width = 25,
                        centralize_selection = true,
                    },
                    renderer = {
                        group_empty = true,
                    },
                    filters = {
                        dotfiles = true,
                    },
                })
            end,
        },
        { -- Rooter (makes sure whatever directory the currently opened folder is in is the working directory in which
          -- commands will execute)
            "notjedi/nvim-rooter.lua",
            config = function()
                require("nvim-rooter").setup()
            end,
        },
        { -- Autopairing braces and stuff
            "windwp/nvim-autopairs",
            config = function()
                require("nvim-autopairs").setup()
            end,
        },
        { -- Autotags (auto completes tags, for languages like html, for example)
            "windwp/nvim-ts-autotag",
            config = function()
                require("nvim-ts-autotag").setup()
            end,
        },
        { -- Diffview
            "sindrets/diffview.nvim"
        },
        { -- Neogit
            "NeogitOrg/neogit",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "sindrets/diffview.nvim",
                "nvim-telescope/telescope.nvim",
            },
            config = true
        },
        { -- Gitsigns
            "lewis6991/gitsigns.nvim",
            config = function()
                require("gitsigns").setup()
            end,
        },
    },
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	check = { enabled = true },
})
