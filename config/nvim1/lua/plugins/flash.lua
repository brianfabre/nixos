return {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
        search = {
            exclude = {
                "notify",
                "cmp_menu",
                "alpha",
                function(win)
                    -- exclude non-focusable windows
                    return not vim.api.nvim_win_get_config(win).focusable
                end,
            },
        },
        jump = {
            autojump = false,
        },
        modes = {
            char = {
                -- set to `false` to use the current line only
                multi_line = false,
                highlight = { backdrop = false },
            },
        },
    },
    keys = {
        {
            "/",
            mode = { "n", "o", "x" },
            function()
                require("flash").jump()
            end,
            desc = "Flash",
        },
        {
            "S",
            mode = { "n" },
            function()
                require("flash").treesitter()
            end,
            desc = "Flash Treesitter",
        },
    },
    config = function()
        vim.api.nvim_set_hl(0, "FlashMatch", {
            bg = "#00FF00",
            fg = "#000000",
            bold = true,
        })

        vim.api.nvim_set_hl(0, "FlashLabel", {
            bg = "#FF0000",
            fg = "#FFFFFF",
            bold = true,
        })

        vim.api.nvim_set_hl(0, "FlashPrompt", {
            bg = "#FFFFFF",
            fg = "#0000FF",
            bold = true,
        })

        vim.api.nvim_set_hl(0, "FlashCurrent", {
            bg = "#ADD8E6",
            fg = "#0000FF",
            bold = true,
        })
    end,
}
