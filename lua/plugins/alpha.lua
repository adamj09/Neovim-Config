return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            [[                   ]],
            [[                   ]],
            [[                   ]],
            [[                   ]],
            [[                   ]],
            [[                   ]],
            [[                   ]],
            [[                   ]],
            [[                   ]],
            [[┏━┓━┏┓━━━━━━━━━━━━━]],
            [[┃┃┗┓┃┃━━━━━━━━━━━━━]],
            [[┃┏┓┗┛┃━━┓━━┓┓┏┓┓┓┏┓]],
            [[┃┃┗┓┃┃┏┓┃┏┓┃┗┛┃┫┗┛┃]],
            [[┃┃━┃┃┃┃━┫┗┛┃┓┏┛┃┃┃┃]],
            [[┗┛━┗━┛━━┛━━┛┗┛━┛┻┻┛]],
            [[━━━━━━━━━━━━━━━━━━━]],
            [[━━━━━━━━━━━━━━━━━━━]],
        }
        dashboard.section.buttons.val = {
            dashboard.button("<leader>   t", "     File Browser", ":Neotree filesystem toggle left <CR>"),
            dashboard.button("<leader>   n", "+     New File", ":ene <BAR> startinsert <CR>"),
            dashboard.button("<leader> f o", "     Recent Files", ":Telescope oldfiles <CR><Esc>"),
            dashboard.button("<leader>   m", "     Manage Sessions", ":SessionManager<CR><Esc>"),
            dashboard.button("<leader> u p", "     Update Plugins", ":Lazy<CR>U"),
            dashboard.button("<leader> u l", "     Update Language Features", ":Mason<CR>U"),
        }
        alpha.setup(dashboard.opts)
    end,
}
