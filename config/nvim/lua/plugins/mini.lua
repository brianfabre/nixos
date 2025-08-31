return {
    { "echasnovski/mini.ai", version = false, opts = {} },
    {
        "echasnovski/mini.indentscope",
        version = false, -- wait till new 0.7.0 release to put it back on semver
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            symbol = "│",
            options = { try_as_border = true },
        },
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "help",
                    "alpha",
                    "dashboard",
                    "lazy",
                    "notify",
                    "toggleterm",
                    "lazyterm",
                },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
        end,
    },

    {
        "echasnovski/mini.bufremove",
        keys = {
            {
                "<leader>x",
                function()
                    require("mini.bufremove").delete(0, false)
                end,
                desc = "[d]elete [b]uffer",
            },
            {
                "<leader>X",
                function()
                    require("mini.bufremove").delete(0, true)
                end,
                desc = "[d]elete [b]uffer (force)",
            },
        },
    },

    {
        "echasnovski/mini.files",
        version = false,
        keys = {
            {
                "-",
                function()
                    require("mini.files").open(vim.api.nvim_buf_get_name(0), false)
                end,
                desc = "open mini files",
            },
        },
        opts = {
            mappings = {
                go_in_plus = "<CR>",
            },
        },
    },

    { "echasnovski/mini.notify", version = false, opts = {} },

    { "echasnovski/mini.cursorword", version = false, opts = {} },
}
