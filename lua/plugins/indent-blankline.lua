return {
    "lukas-reineke/indent-blankline.nvim",
    config = function ()
        require("ibl").setup({
            indent = { char = "▏" },
            scope = { enabled = true },
            whitespace = {
                remove_blankline_trail = false,
            },
        })
    end,
}
