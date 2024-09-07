local M = {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
            require("which-key").setup({
                plugins = {
                    spelling = {
                        enabled = true,
                    },
                },
                win = {
                    border = "single",
                },
                -- ignore_missing = true,
                notify = false,
            })

            local wk = require("which-key")
            wk.add({
                { "<leader>d", group = "buffer" },
                { "<leader>c", group = "directory" },
                { "<leader>f", group = "files" },
                { "<leader>g", group = "git" },
                { "<leader>l", group = "lsp / lazy(git)" },
                { "<leader>o", group = "open" },
                { "<leader>p", group = "run code" },
                { "<leader>q", group = "quit" },
                { "<leader>r", group = "rename lsp" },
                { "<leader>s", group = "search fzf" },
                { "<leader>u", group = "ui" },
                { "<leader>w", group = "wiki" }
            })
        end,
    },
}

return M
