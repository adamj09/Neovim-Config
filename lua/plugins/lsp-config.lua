return {
    {
        "mfussenegger/nvim-jdtls",
        dependencies = { "mfussenegger/nvim-dap" },
    },
	{ -- Mason, Mason-lspconfig, and nvim-lspconfig
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup()

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({ capabilities = capabilities })
				end,
                ["jdtls"] = noop, -- Prevent lspconfig from loading JDTLS
			})
		end,
		opts = {
			ensure_installed = {
				-- Lua
				"lua_ls",
				"stylua",
				-- C, C++, and Rust
				"rust_analyzer",
				"rustfmt",
				"clangd",
				"clang-format",
				"codelldb",
				-- Java
				"google-java-format",
			},
		},
	},
}
