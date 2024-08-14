return {
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
        opts = {
            handlers = {},
        },
    },
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            { "rcarriga/nvim-dap-ui", event = "VeryLazy" },
            "theHamsta/nvim-dap-virtual-text",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dapui.setup()

            -- Start DAP UI upon debugging
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end

            -- Keymaps 
            vim.keymap.set("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", {})
            vim.keymap.set(
                "n",
                "<Leader>dbc",
                "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>"
            )
            vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", {})
            vim.keymap.set("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", {})
            vim.keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", {})
            vim.keymap.set("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", {})
            vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", {})
            vim.keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", {})
            vim.keymap.set("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", {})
            vim.keymap.set("n", "<leader>dt", "<cmd>lua require'dapui'.close()<cr><cmd>lua require'dap'.terminate()<cr>", {})
        end,
    },
}
